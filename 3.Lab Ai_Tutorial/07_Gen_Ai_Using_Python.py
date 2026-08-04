# import os

# os.environ["HF_HUB_DISABLE_SYMLINKS_WARNING"]="1"

# from transformers import pipeline

# generator = pipeline(
#     "text-generation",
#     model="gpt2"
# )

# result = generator(
#     "Explain Python programming language in simple words.",
#     max_length=50,
#     num_return_sequences=1
# )

# print(
# result[0]['generated_text']
# )

text ='How to i learn python in simple terms'

from transformers import pipeline

generator = pipeline(
    "text-generation",
    model="gpt2"
)

result = generator(
    text,
    max_new_tokens=50,
    do_sample=True,
    temperature=0.8
)

print(result)