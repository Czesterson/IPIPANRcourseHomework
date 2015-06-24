#include <Rcpp.h>
using namespace Rcpp;
using namespace std;

//' @title Returns vector's mode.
//' @description This function calculates the most frequently
//' occurring value in an integer vector (mode).
//' If the mode is ambiguous returns the lowest mode.
//' Please note that "mode" overrides mode function
//' from base package.
//'
//' @param x1 - integer vector
//' @return - integer
//'
//' @export
// [[Rcpp::export]]
int mode(const IntegerVector x1)
{
    IntegerVector x = Rcpp::clone(x1);
    sort(x.begin(), x.end());
    int nx = x.size();
    int max=0;
    int result=x[0];
    int current=0;
    for (int i=1; i<nx; i++)
    {
        // after sorting we count how many are identical in a row
        if (x[i] == x[i-1])
        {
            current++;
        }
        else
        {
            // next not identical, check if previous sequence is the longest
            if (current > max)
            {
                max = current;
                result = x[i-1];
            }
            current = 0;
        }
    }
    if (current > max)
    {
        result = x[nx-1];
    }
    return result;
}

