greet = fn -> IO.puts("hola amigos,,,")
              IO.puts("pwd: "<> System.get_env("PWD"))
end

System.put_env("PWD", "kaka")
System.put_env("USER", "lola")
