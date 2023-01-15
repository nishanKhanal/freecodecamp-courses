class Category:

  def __init__(self, name):
    self.name = name
    self.ledger = []

  def deposit(self, amount, description=""):
    self.ledger.append({"amount": amount, "description": description})

  def withdraw(self, amount, description=""):
    if self.check_funds(amount):
      self.ledger.append({"amount": -amount, "description": description})
      return True
    return False

  def get_balance(self, type=None):
    total = 0
    if type is None:
      for item in self.ledger:
        total += item["amount"] if type is None else 0
      return total

    if type == "withdrawl":
      for item in self.ledger:
        total += item["amount"] if item["amount"] < 0 else 0
      return total

    if type == "deposit":
      for item in self.ledger:
        total += item["amount"] if item["amount"] > 0 else 0
      return total

  def transfer(self, amount, otherCategory):
    withdraw_successfull = self.withdraw(
      amount, description=f"Transfer to {otherCategory.name}")
    if withdraw_successfull:
      otherCategory.deposit(amount, description=f"Transfer from {self.name}")
      return True
    return False

  def check_funds(self, amount):
    return amount <= self.get_balance()

  def __str__(self):
    output = f"{self.name:{'*'}^30}\n"
    for item in self.ledger:
      output += f"{item['description'][:23]:23}{item['amount']:7.2f}\n"
    output += f"Total: {self.get_balance()}"
    return output


def create_spend_chart(categories):
  withdrawl_list = []
  total = 0
  for category in categories:
    total += round(category.get_balance("withdrawl"), 2)
    withdrawl_list.append(
      (category.name, round(category.get_balance("withdrawl"), 2)))

  for i, item in enumerate(withdrawl_list):
    withdrawl_list[i] = (item[0], int(round(item[1] / total, 2) * 10))

  final_string = "Percentage spent by category\n"
  for i in range(10, -1, -1):
    final_string += f"{str(i*10):>3}|"
    bar_graph_string = ""
    for item in withdrawl_list:
      if item[1] >= i:
        bar_graph_string += " o "
      else:
        bar_graph_string += "   "

    bar_graph_string += " \n"
    final_string += bar_graph_string

  dashed_line = "    " + '-' * (len(withdrawl_list) * 3 + 1) + '\n'
  final_string += dashed_line

  x_label = ""
  max_length_of_category_items = max([len(item[0]) for item in withdrawl_list])
  for i in range(max_length_of_category_items):
    x_label += "    "
    for item in withdrawl_list:
      try:
        x_label += f" {item[0][i]} "
      except:
        x_label += " " * 3
    x_label += " \n"

  final_string += x_label
  return (final_string[:-1])
