% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helper_functions.R
\name{question_from_response_column}
\alias{question_from_response_column}
\title{Get the Index of the Question Corresponding to a Response Column}
\usage{
question_from_response_column(blocks, response_name)
}
\arguments{
\item{blocks}{A list of the survey blocks, with the questions and responses inserted
in place of the BlockElements. Structuring the blocks in this way is automatically
handled by get_reorganized_questions_and_blocks, but can also be performed by (after
inserting the responses into questions) using the questions_into_blocks method.}

\item{response_name}{The string name of a column from a Qualtrics response dataset.}
}
\value{
A pair, (i, j) which specifies a question as blocks[[i]][['BlockElements']][[j]].
}
\description{
Use this function to get the location of a question
in the blocks list. Give it a response column name, and it will
try to find the question it corresponds to. Otherwise, it will
error. The blocks have two layers of indexing, one for the individual
blocks, and then another for the BlockElements. This function will return a
pair of indices, (i, j) where blocks[[i]][['BlockElements']][[j]] specifies the
location of the question which has the response_name column among its linked responses.
}
\details{
This function uses a primitive caching system to store a lookup table from the
response column names to the pairs of block and block element indices in the
package's environment, and recall it when the blocks have not changed between
the construction of the lookup table and the current recent function call.
The caching system uses a hash of the blocks, a string associated to
the blocks such that if the blocks passed in are different, the hash of the
blocks will be different, in order to tell when the blocks have changed.
When the hash of the blocks passed as an argument match the hash stored in
the cached lookup table, the cached lookup table is used. Otherwise, it is
computed again and the lookup table in the environment is updated.
}
