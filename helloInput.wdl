version 1.0
workflow HelloInput {
  input {
    String name_input
  }
  call WriteGreeting {
    input:
      name_for_greeting = name_input
  }
  output {
    File final_output = WriteGreeting.Greeting_output
  }
}

task WriteGreeting {
  input {
    String name_for_greeting
  }
  command <<<
    echo 'hello ~{name_for_greeting}!'
  >>>
  output {
    File Greeting_output = stdout()
  }
  runtime {
    docker:'ubuntu:latest'
  }
}