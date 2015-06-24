#include <Rcpp.h>
#include <iostream>
using namespace Rcpp;
using namespace std;

//' @title Mimics built-in simplify2array function.
//' @description This function behaves as most similar
//' to simplify2array as possible.
//' If list contains vectors of length 1, returns vector.
//' If list contains vectors of the same length, returns matrix.
//' Otherwise returns not changed List.
//'
//' @param L - List of numeric vectors to convert
//' @param higher (optional) - not used in this implementation
//' @return - matrix, vector or list
//'
//' @export
// [[Rcpp::export]]
SEXP simplify2array2(const List L, bool higher = true)
{
    if (L.size() == 0)
        stop("List shall have at least one element");
    for (int i=0; i<L.size(); i++)
        if (!Rf_isNumeric(L[i]) || !Rf_isVectorAtomic(L[i]))
            stop("List shall contain numeric vectors!");
    NumericVector L2[L.size()];
    for (int i=0; i<L.size(); i++)
    {
        L2[i] = L[i];
        // if vectors are of different length return L not changed
        if (L2[i].size() != L2[0].size())
            return L;
    }

    if (L2[0].size() == 1)
    {
        // all vectors of length 1 - return vector
        NumericVector ret(L.size());
        for (int i=0; i<L.size(); i++)
            ret[i] = L2[i][0];
        return ret;
    }
    
    // otherwise return matrix
    NumericMatrix ret(L2[0].size(), L.size());
    for (int i=0; i<L.size(); i++)
        for (int j=0; j<L2[i].size(); j++)
            ret(j, i) = L2[i][j];
    return ret;
}
