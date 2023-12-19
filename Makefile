.PHONY: clean
FLAG=-std=c++17 -O3 -m64 -fopenmp

all:
	g++ $(FLAG) FP_growth.cpp -o FP_growth

test: all
	./FP_growth 2 < data1.txt
	diff -u result.txt ans1.txt > diff.txt

test_ibm-5000: all
	./FP_growth 2 < ibm-5000.txt
	diff -u result.txt ans_ibm-5000.txt > diff.txt

test_all_data: all
	./FP_growth 2 < dataset/data1.txt
	diff -u result.txt ans_dataset/ans1.txt > diff/diff1.txt
	./FP_growth 2 < dataset/data2.txt
	diff -u result.txt ans_dataset/ans2.txt > diff/diff2.txt
	./FP_growth 2 < dataset/data3.txt
	diff -u result.txt ans_dataset/ans3.txt > diff/diff3.txt
	./FP_growth 2 < dataset/data4.txt
	diff -u result.txt ans_dataset/ans4.txt > diff/diff4.txt
	./FP_growth 2 < dataset/data5.txt
	diff -u result.txt ans_dataset/ans5.txt > diff/diff5.txt
	./FP_growth 2 < dataset/data6.txt
	diff -u result.txt ans_dataset/ans6.txt > diff/diff6.txt
	./FP_growth 2 < dataset/data7.txt
	diff -u result.txt ans_dataset/ans7.txt > diff/diff7.txt
	./FP_growth 2 < dataset/data8.txt
	diff -u result.txt ans_dataset/ans8.txt > diff/diff8.txt
	./FP_growth 2 < dataset/data9.txt
	diff -u result.txt ans_dataset/ans9.txt > diff/diff9.txt

clean:
	rm -r .vscode FP_growth result.txt