#!/usr/bin/python
import json
import sys
x = json.load(open("/usr/share/iso-codes/json/iso_639-2.json"))
print([l for l in x["639-2"] if "alpha_2" in l and l["alpha_2"] == sys.argv[1]][0]["name"])
