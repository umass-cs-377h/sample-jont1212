#! /bin/bash
# (1) Builds the gradescope graders and puts them in a graders directory.
# (2) Builds the student project distributions and puts them in the students directory.

rm -rf graders
mkdir graders

echo "Building gradescope autograders..."
# Build the gradescope graders for each project
for fi in `ls | grep -E '^p[0-9]+$'`; do
  cd $fi/$fi-gradescope
  make clean
  zip -r $fi-gradescope.zip .
  mv $fi-gradescope.zip ../../graders/
  cd ../..
done
