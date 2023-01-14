import re

class Problem:

  def __init__(self, problem_string):

    match = re.match('.*([+-]).*', problem_string)
    if match is None:
      raise Exception("Error: Operator must be '+' or '-'.")

    self.operator = match.groups()[0]

    operand_list = problem_string.split(f" {self.operator} ")
    self.operand_1, self.operand_2 = operand_list[0], operand_list[1]

    if (len(self.operand_1) > 4 or len(self.operand_2) > 4):
      raise Exception("Error: Numbers cannot be more than four digits.")

    try:
      self.operand_1 = int(self.operand_1)
      self.operand_2 = int(self.operand_2)
    except:
      raise Exception("Error: Numbers must only contain digits.")

    operand_1_width = len(str(self.operand_1))
    operand_2_width = len(str(self.operand_2))
    self.max_width = operand_1_width if operand_1_width > operand_2_width else operand_2_width

  def __str__(self):
    return f"{self.operand_1} {self.operator} {self.operand_2} = {self.get_result()}\n"

  def get_formatted_result(self):
    result = 0
    if self.operator == '+':
      result = self.operand_1 + self.operand_2
    else:
      result = self.operand_1 - self.operand_2
    return f"{result:{self.max_width + 2}}"


def arithmetic_arranger(problems, answers=False):
  number_of_problems = len(problems)
  if number_of_problems > 5:
    return "Error: Too many problems."

  first_line = ""
  second_line = ""
  dashed_line = ""
  answers_line = ""

  for problem_string in problems:
    try:
      problem = Problem(problem_string)
      first_line += f"{problem.operand_1:{problem.max_width+2}}    "
      second_line += f"{problem.operator} {problem.operand_2:{problem.max_width}}    "
      dashed_line += "-" * (problem.max_width + 2) + "    "
      if answers:
        answers_line += problem.get_formatted_result() + "    "
    except Exception as e:
      return (e.args[0])

  final_string = first_line[:-4] + "\n" + second_line[:-4] + "\n" + dashed_line[:-4]
  final_string += ("\n" + answers_line[:-4]) if answers else ""

  return final_string
