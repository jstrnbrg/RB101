require 'pry'

STACK = []
$register = 0

def perform_command(command)
  case command
  when "PUSH"
    STACK.push($register)
  when "ADD"
    $register += STACK.pop
  when "SUB"
    $register -= STACK.pop
  when "MULT"
    $register *= STACK.pop
  when "DIV"
    $register /= STACK.pop
  when "MOD"
    $register %= STACK.pop
  when "POP"
    $register = STACK.pop
  when "PRINT"
    puts $register
  else
    $register = command.to_i
  end
end

def minilang(command)
  command.split.each do |command|
    perform_command(command)
  end
end


minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
