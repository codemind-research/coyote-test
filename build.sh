build_project() {
  cd "$1"
  mkdir -p build
  cd build
  cmake ..
  make -j 4
  cd ../../
}

fprime_build() {
  cd "$1"
  python3 -m venv fprime-venv
  . fprime-venv/bin/activate
  pip install -U fprime-tools
  pip install -r "requirements.txt"
  mkdir -p build
  cd build
  cmake ..
  make -j 4
  cd ../../
}

projects=("JsonBox" "hjson-cpp" "json-voorhees" "jsoncpp" "jvar" "re2" "tinyxml2" "yaml-cpp" "fprime")

for project in "${projects[@]}"; do
  if [[ "$project" == "fprime" ]]; then
    fprime_build "$project"
  else
    build_project "$project"
  fi
done