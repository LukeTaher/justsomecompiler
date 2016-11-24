#!/bin/bash

rm -f asm7.log
rm -f assembly/*
rm -f executables/*

# printf "> Running asm7 legacy tests\n\n"
for test in asm*
do
	printf "\n > Running %s tests in x86 mode\n\n" $test
	cd $test
	./run.sh
	cd ../
	if [ -f "$test/$test.log" ]; then
		printf "======= Failed $test tests =======\n\n" >> asm7.log
		cat "$test/$test.log" >> asm7.log
		printf "\n\n" >> asm7.log
		rm -f "$test/$test.log"
	fi
done

rm -f *.out
