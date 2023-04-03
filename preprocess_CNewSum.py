import json

all_txt = []

with open("final/train.simple.label.jsonl", "r") as file:
    for line in file:
        article = json.loads(line)["article"]
        summary = json.loads(line)["summary"]
        for each in article:
            each = each.replace(" ", "")
            all_txt.append(each)
        summary = summary.replace(" ", "")
        all_txt.append(summary)

with open("final/dev.simple.label.jsonl", "r") as file:
    for line in file:
        article = json.loads(line)["article"]
        summary = json.loads(line)["summary"]
        for each in article:
            each = each.replace(" ", "")
            all_txt.append(each)
        for each in summary:
            each = each.replace(" ", "")
            all_txt.append(each)

with open("final/test.simple.label.jsonl", "r") as file:
    for line in file:
        article = json.loads(line)["article"]
        summary = json.loads(line)["summary"]
        for each in article:
            each = each.replace(" ", "")
            all_txt.append(each)
        for each in summary:
            each = each.replace(" ", "")
            all_txt.append(each)

# number = 10000
with open("all_news_and_summaries.txt", "w") as file:
    for line in all_txt:
        file.write(line)
        file.write("\n")

print(len(all_txt))