getSpeeches <- function(folder.path, extra.words=list()){
  docs <- Corpus(DirSource(folder.path))   
  docs <- tm_map(docs, stripWhitespace)
  docs <- tm_map(docs, content_transformer(tolower))
  docs <- tm_map(docs, removeNumbers)
  docs <- tm_map(docs, removeWords, stopwords("english"))
  if(length(extra.words)>0){
    docs <- tm_map(docs, removeWords, extra.words)
  }
  docs <- tm_map(docs, removePunctuation)
  docs <- tm_map(docs, removeWords, character(0))
  docs <- tm_map(docs, stemDocument)
  return(docs)
}

