#include <iostream>
#include <boost/any.hpp>
#include <boost/thread.hpp>

int main() {
  // New in Boost 1.55
  boost::any foo = 42;
  foo.clear();

  int num_cores = boost::thread::physical_concurrency();
  int num_threads = boost::thread::hardware_concurrency();

  std::cout << "Hello world!" << std::endl;
  std::cout << "I got " << std::to_string(num_cores) << " cores!" << std::endl;
  std::cout << "I got " << std::to_string(num_threads) << " threads!" << std::endl;
  std::cout << "Hello world!" << std::endl;
  return 0;
}
