# python_ocr
docker container to return text from image


# To build image: 

- docker build . -t ocr_python

# To build and start container:
- docker run -p 5060:5060  ocr_python


#Example: 
![Running exemple](img/Ocr.gif)

# API
- Just send a binary file to /api/ocr
