package luavim
func main(){
  value := 1
  if value == 1 {
    println("value is 1")
  } else {
    println("value is not 1")
  }
}

// create a function to add two numbers
func add(a, b int) int {
  return a + b
}
// create a function to substract two numbers
func substract(a, b int) int {
  return a - b
}
// create a function to multiply two numbers
func multiply(a, b int) int {
  return a * b
}
// create a function to divide two numbers
func divide(a, b int) int {
  return a / b
}  
// create a function to modulo two numbers
func modulo(a, b int) int {
  return a % b
}
// create a function to exponentiate two numbers
func exponentiate(a, b int) int {
  return a ^ b
}
// create a function to return the absolute value of a numbers
func absolute(a int) int {
  if a < 0 {
    return -a
  }
  return a
}
// create a function to return the maximum of two numbers
func maximum(a, b int) int {
  if a > b {
    return a
  }
  return b
}

