#!/bin/bash

printf "\n===== ♻  Cleaning & Compiling ♻  =====\n\n"
make clean -C../../ && make -C../../
rm -f test.log
printf "\n===== ⚙  Running final test script ⚙  =====\n"
for set in asm*
do
	cd $set

	printf "\n> Running $set tests in x86 mode\n\n"
	for test in test*
	do
		rm -f "$test.out"

		input=""
		if [ -f "input/$test.in" ]; then
		    input="$(cat 'input/'$test.in)"
		fi

		../../../some_lang.native -x86 "$test" &> "assembly/$test.s"
		as "assembly/$test.s" -o "$test.o"
		ld -lc -macosx_version_min "10.11" "$test.o" -o "executables/$test" 2> /dev/null
		rm -f "$test.o"
		printf "$input" | ./"executables/$test" &> "$test.out"
		cmp -s "$test.out" "expected/$test.exp"

		if [ $? -eq 0 ]; then
			printf "✅  Passed $test\n"
		else
			printf "❗  Failed $test\n"
			printf "===== Failed $test =====\n\n" >> $set.log
			printf "===== Input:\n" >> $set.log
			cat "$test" >> $set.log
			printf "===== Expected:\n" >> $set.log
			cat "expected/$test.exp" >> $set.log
			printf "\n===== Output:\n" >> $set.log
			cat "$test.out" >> $set.log
			printf "\n===== Error:\n" >> $set.log
			cmp "$test.out" "expected/$test.exp" >> $set.log
			printf "\n\n" >> $set.log
		fi
	done

	rm -f *.out

	cd ../
	if [ -f "$set/$set.log" ]; then
		printf "======= Failed $set tests =======\n\n" >> ../test.log
		cat "$set/$set.log" >> ../test.log
		printf "\n\n" >> ../test.log
		rm -f "$set/$set.log"
	fi
done

if [ -f test.log ]; then
		printf "\n===== ❌  Testing complete  ❌ =====\n\n"
		printf "❗  Tests failed - see test/test.log for more\n\n"
else
		printf "\n===== 🔥💯  Testing complete 🔥💯  =====\n\n"
		printf "✅  All tests passed\n\n"
fi
