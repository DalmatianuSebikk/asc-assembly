#include <iostream>
using namespace std;
int main(){
	int n, nr_biti = 0, maxim = 0;
	cin >> n;
	while(n != 0){
		if(n % 2 == 1){
			nr_biti++;
		}
		else{
			if(maxim < nr_biti)
				maxim = nr_biti;
			nr_biti = 0;
		}
		n /= 2;
	}
	if(maxim < nr_biti)
	    maxim = nr_biti;
	cout << maxim;
	return 0;
}