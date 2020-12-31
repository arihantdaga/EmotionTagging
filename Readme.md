## Emotion Tagging
This is demonstration of a simple application which can return emotion-tag for any given text. 
I have many notes in my journal which i wrote on different days. I wanted to tag all of them with my mood. I didn't want to do it all manually. So... 

This is based on a pretrained model available on hugging face. [mrm8488/t5-base-finetuned-emotion](https://huggingface.co/mrm8488/t5-base-finetuned-emotion). 

### How to run
With Docker
```
docker-compose up
```

Send a post request with the input text
```JavaScript
curl --location --request POST '127.0.0.1:5005/get_emotion' \
--header 'Content-Type: application/json' \
--data-raw '{
    "text": "I think i am very happy to finally have deployed my first model"
}'

// Or NodeJs

var request = require('request');
var options = {
  'method': 'POST',
  'url': '127.0.0.1:5005/get_emotion',
  'headers': {
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({"text":"I think i am very happy to finally have deployed my first model"})

};
request(options, function (error, response) {
  console.log(response.body); // <pad> joy
});


```




