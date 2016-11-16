#!/bin/bash

rm -f asm6.log
rm -f assembly/*
rm -f executables/*

printf "> Running asm6 compilation tests\n\n"
for test in test*
do
	rm -f "$test.out"
	../../some_lang.native -x86 "$test" &> "assembly/$test.s"
	gcc "assembly/$test.s" -o "executables/$test"
	./"executables/$test" &> "$test.out"
	cmp -s "$test.out" "expected/$test.exp"
	if [ $? -eq 0 ]; then
		printf "✅  Passed $test\n"
	else
		printf "❗  Failed $test\n"
		printf "===== Failed $test =====\n\n" >> asm6.log
		printf "===== Input:\n" >> asm6.log
		cat "$test" >> asm6.log
		printf "===== Expected:\n" >> asm6.log
		cat "expected/$test.exp" >> asm6.log
		printf "\n===== Output:\n" >> asm6.log
		cat "$test.out" >> asm6.log
		printf "\n===== Error:\n" >> asm6.log
		cmp "$test.out" "expected/$test.exp" >> asm6.log
		printf "\n\n" >> asm6.log
	fi
done

rm -f *.out
