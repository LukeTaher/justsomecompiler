#!/bin/bash

rm -f asm4.log

printf "> Running compatible asm1 tests in optimisation mode\n\n"
cd ../asm2
for test in legacy*
do
	rm -f "../asm4/$test.out"
	../../some_lang.native "$test" &> "../asm4/$test.out"
	cmp -s "../asm4/$test.out" "expected/$test.exp"
	if [ $? -eq 0 ]; then
		printf "✅  Passed $test\n"
	else
		printf "❗  Failed $test\n"
		printf "===== Failed $test =====\n\n" >> ../asm4/asm4.log
		printf "===== Input:\n" >> ../asm4/asm4.log
		cat "$test" >> ../asm4/asm4.log
		printf "===== Expected:\n" >> ../asm4/asm4.log
		cat "expected/$test.exp" >> ../asm4/asm4.log
		printf "\n===== Output:\n" >> ../asm4/asm4.log
		cat "$test.out" >> ../asm4/asm4.log
		printf "\n===== Error:\n" >> ../asm4/asm4.log
		cmp "$test.out" "expected/$test.exp" >> ../asm4/asm4.log
		printf "\n\n" >> ../asm4/asm4.log
	fi
done

printf "\n> Running asm2 evaluation tests in optimisation mode\n\n"
for test in test*
do
	rm -f "../asm4/$test.out"
	../../some_lang.native "$test" &> "../asm4/$test.out"
	cmp -s "../asm4/$test.out" "expected/$test.exp"
	if [ $? -eq 0 ]; then
		printf "✅  Passed $test\n"
	else
		printf "❗  Failed $test\n"
		printf "===== Failed $test =====\n\n" >> ../asm4/asm4.log
		printf "===== Input:\n" >> ../asm4/asm4.log
		cat "$test" >> ../asm4/asm4.log
		printf "===== Expected:\n" >> ../asm4/asm4.log
		cat "expected/$test.exp" >> ../asm4/asm4.log
		printf "\n===== Output:\n" >> ../asm4/asm4.log
		cat "$test.out" >> ../asm4/asm4.log
		printf "\n===== Error:\n" >> ../asm4/asm4.log
		cmp "$test.out" "expected/$test.exp" >> ../asm4/asm4.log
		printf "\n\n" >> ../asm4/asm4.log
	fi
done

rm -f ../asm4/*.out

printf "\n> Running asm3 evaluation tests in optimisation mode\n\n"
cd ../asm3
for test in test*
do
	rm -f "../asm4/$test.out"
	../../some_lang.native -o "$test" &> "../asm4/$test.out"
	cmp -s "../asm4/$test.out" "expected/$test.exp"
	if [ $? -eq 0 ]; then
		printf "✅  Passed $test\n"
	else
		printf "❗  Failed $test\n"
		printf "===== Failed $test =====\n\n" >> ../asm4/asm4.log
		printf "===== Input:\n" >> ../asm4/asm4.log
		cat "$test" >> ../asm4/asm4.log
		printf "===== Expected:\n" >> ../asm4/asm4.log
		cat "expected/$test.exp" >> ../asm4/asm4.log
		printf "\n===== Output:\n" >> ../asm4/asm4.log
		cat "$test.out" >> ../asm4/asm4.log
		printf "\n===== Error:\n" >> ../asm4/asm4.log
		cmp "$test.out" "expected/$test.exp" >> ../asm4/asm4.log
		printf "\n\n" >> ../asm4/asm4.log
	fi
done

rm -f ../asm4/*.out
