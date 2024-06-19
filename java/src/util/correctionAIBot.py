import os
import openai

openai.api_key = "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"

response = openai.ChatCompletion.create(
  model="gpt-3.5-turbo",
  messages=[],
  temperature=0,
  max_tokens=256
)
