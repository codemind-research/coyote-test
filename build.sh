build_project() {
  cd "$1"
  mkdir -p build
  cd build
  cmake ..
  make -j 4
  cd ../../
}

projects=("JsonBox" "hjson-cpp" "json-voorhees" "jsoncpp" "jvar" "re2" "tinyxml2" "yaml-cpp")

for project in "${projects[@]}"; do
  build_project "$project"
done