#!/bisn/bash

MOVIES=("Inception" "The Matrix" "Interstellar" "The Godfather")

echo first movie: ${MOVIES[0]}
echo second movie: ${MOVIES[1]}
echo third movie: ${MOVIES[2]}
echo fourth movie: ${MOVIES[3]}

echo "All movies: ${MOVIES[@]}"
