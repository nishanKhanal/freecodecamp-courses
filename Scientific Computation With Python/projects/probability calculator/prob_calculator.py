import copy
import random

class Hat:

  def __init__(self, **kwargs):
    self.contents = []
    for item in kwargs.items():
      self.contents.extend([item[0]] * item[1])

  def draw(self, number_of_balls):
    number_of_balls = len(self.contents) if number_of_balls > len(
      self.contents) else number_of_balls
    random_choice_list = []
    for i in range(number_of_balls):
      choice = random.choice(self.contents)
      random_choice_list.append(choice)
      self.contents.remove(choice)
    return random_choice_list


def experiment(hat, expected_balls, num_balls_drawn, num_experiments):

  num_successful_outcomes = 0
  for i in range(num_experiments):
    hat_copy = copy.deepcopy(hat)
    try:
      outcome_list = hat_copy.draw(num_balls_drawn)
      outcome_dictionary = {}

      for outcome_item in outcome_list:
        outcome_dictionary[outcome_item] = outcome_dictionary.get(outcome_item, 0) + 1
      print("O", outcome_dictionary)
      for expected_item in expected_balls.items():
        if (expected_item[0] not in outcome_list):
          # print(f"{expected_item[0]} ball not found")
          raise Exception("Not found")
        if (expected_balls[expected_item[0]] > outcome_dictionary[expected_item[0]]):
          # print(f"Not enough {expected_item[0]} balls")
          raise Exception("Not enough balls of a kind")
    except:
      # print("not a success")
      continue
    num_successful_outcomes += 1
    # print("success")


  print("no. success: ", num_successful_outcomes)
  probability = num_successful_outcomes / num_experiments

  return probability