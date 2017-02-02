getSpeeches <- function(folder.path){
  docs <- Corpus(DirSource(folder.path))   
  docs <- tm_map(docs, stripWhitespace)
  docs <- tm_map(docs, content_transformer(tolower))
  docs <- tm_map(docs, removeWords, stopwords("english"))
  docs <- tm_map(docs, removePunctuation)
  docs <- tm_map(docs, removeWords, character(0))
  return(docs)
}

