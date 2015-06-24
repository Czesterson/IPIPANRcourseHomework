#' @title Generates all possible assignments of survey participants.
#' @description This function generates all possible 0-1 assignment
#' vectors of 2n survey participants in such a way that
#' exactly n of them are assigned to group 0 (control)
#' and the other n ones are assigned to group 1 (treatment).
#' This is R reference function for benchmark tests.
#'
#' @param n - single integer - number of participants
#' @return - matrix
#' @export
ass2 <- function(n)
{
	# just reuse my function from 2nd homework :)
	internal_perm <- function(x)
	{
		# stop of recursion - single element
		if (length(x) == 1)
        	return (matrix(x, nrow = 1, ncol = 1))

	    # recursion, generate permutation of matrix withouy first column
    	partial_perm <- internal_perm(x[-1])

	    # add new element for each permutation in each column
    	k <- ncol(partial_perm)
	    ret_matrix <- NULL
    	for (i in 0:k)
	    {
    	    # take left i columns and add to them new column with new value
        	new_perms <- cbind(partial_perm[,0:i], rep(x[1], nrow(partial_perm)))
	        # and add to result right (k-i) columns
    	    if(i < k)
        	{
            	new_perms <- cbind(new_perms, partial_perm[,(i+1):k])
	        }

    	    # add to premutations generated in for por lower 'i'
        	ret_matrix <- rbind(ret_matrix, new_perms)
    	}

 	   return(ret_matrix)
	}

	n <- as.integer(n)
    stopifnot(1 == length(n), n > 0)
    to_permute <- c(rep(0,n), rep(1,n))
    # generate all permutations
    all_perms <- internal_perm(to_permute)
	# sort them
#	all_perms <- all_perms[do.call(order,as.data.frame(all_perms)),]
    # add fake 0 row
#    all_perms <- rbind(rep(0,2*n), all_perms)
#    ret_matrix <- NULL

#    for (i in 2:nrow(all_perms))
#       if(any(all_perms[i-1,]!=all_perms[i,]))
#           ret_matrix <- rbind(ret_matrix, all_perms[i,])
	ret_matrix <- unique(all_perms)
    ret_matrix
}
