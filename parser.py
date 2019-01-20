import re
import sys
import pandas as pd
from smart_open import smart_open

rx_dict = {
  'map' : re.compile(r'map\s+(?P<topic>\d+)\s+(?P<value>.*)\n'),
  'prec': re.compile(r'Rprec\s+(?P<topic>\d+)\s+(?P<value>.*)\n'),
  'p10' : re.compile(r'P_10\s+(?P<topic>\d+)\s+(?P<value>.*)\n')
}

def _parse_line(line):
  for key, rx in rx_dict.items():
    match = rx.search(line)
    if match:
      return key, match
  return None, None

def parse_file(filepath):
  data = []
  with smart_open(filepath, 'r') as file_object:
    record = {}
    for line in file_object:
      key, match = _parse_line(line)
      if match is None:
        continue
      topic = int(match.group('topic'))
      if bool(record.get('topic')) and record.get('topic') != topic:
        data.append(record.copy())
      record['topic'] = topic
      value = float(match.group('value'))
      if key == 'map':
        record['AP'] = value
      elif key == 'prec':
        record['prec'] = value
      elif key == 'p10':
        record['p10'] = value
    if bool(record): data.append(record.copy())
    data = pd.DataFrame(data, columns=['topic', 'AP', 'prec', 'p10'])
    data.set_index('topic', inplace=True)
    return data

filepath = sys.argv[1]
filename = sys.argv[2]

a = parse_file(filepath)
topics = ['AP', 'prec', 'p10']
for j in range(len(topics)):
  f = open(topics[j]+"_"+filename, 'a')
  b = list(a[topics[j]])
  for i in range(len(a)):
      f.write(str(b[i])+"\n")
