#include <Rcpp.h>
#include <algorithm>
using namespace Rcpp;
using namespace std;

int C(int up, int down)
{
    // Calculates upCdown
    int ret=1;
    for(int i=(up-down)+1; i<=up; i++)
        ret *= i;
    for(int i=2; i<=down; i++)
        ret /= i;
    return ret;
}
int silna(int n)
{
    int ret=1;
    for(int i=2;i<n; i++)
        ret*=i;
    return ret;
}

//' @title Generates all possible assignments of survey participants.
//' @description This function generates all possible 0-1 assignment
//' vectors of 2n survey participants in such a way that
//' exactly n of them are assigned to group 0 (control)
//' and the other n ones are assigned to group 1 (treatment).
//'
//' @param n - single integer - number of participants
//' @return - matrix
//'
//' @export
// [[Rcpp::export]]
NumericMatrix ass(int n)
{
	if (n <= 0)
		stop("n shall be greater than 0");
    int rows=C(2*n,n);
    NumericMatrix ret(rows, 2*n);
    int it=0;
    int row[2*n];
    for (int i=0;i<n;i++)
        row[i]=0;
    for (int i=n;i<2*n;i++)
        row[i]=1;
    do
    {
        for(int i=0;i<2*n;i++)
            ret(it,i) = row[i];
        it++;
    } while ( std::next_permutation(row,row+2*n) && it<rows);
    return ret;
}

