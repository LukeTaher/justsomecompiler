#!/bin/bash

rm -f asm7.log
rm -f assembly/*
rm -f executables/*

# printf "> Running asm7 compilation tests\n\n"
for test in test*
do
	rm -f "$test.out"
	../../../some_lang.native -x86 "$test" &> "assembly/$test.s"
	gcc "assembly/$test.s" -o "executables/$test"
	./"executables/$test" &> "$test.out"
	cmp -s "$test.out" "expected/$test.exp"
	if [ $? -eq 0 ]; then
		printf "✅  Passed $test\n"
	else
		printf "❗  Failed $test\n"
		printf "===== Failed $test =====\n\n" >> asm7.log
		printf "===== Input:\n" >> asm7.log
		cat "$test" >> asm7.log
		printf "===== Expected:\n" >> asm7.log
		cat "expected/$test.exp" >> asm7.log
		printf "\n===== Output:\n" >> asm7.log
		cat "$test.out" >> asm7.log
		printf "\n===== Error:\n" >> asm7.log
		cmp "$test.out" "expected/$test.exp" >> asm7.log
		printf "\n\n" >> asm7.log
	fi
done

rm -f *.out
