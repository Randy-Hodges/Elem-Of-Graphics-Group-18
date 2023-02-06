import re

def openfile():
    file = open("mytext.txt", "r")
    pattern = '[a-z]+'
    allTextArray = []
    uniqueWordsArray = []
    
    # create files
    allText = open("allwords.txt", "x")
    uniqueWords = open("uniquewords.txt" , "x")
    wordFrequency = open("wordfrequency.txt", "x")

    # write in files
    allText = open("allwords.txt", "w")
    uniqueWords = open("uniquewords.txt" , "w")
    wordFrequency = open("wordfrequency.txt", "w")

    for singleLine in file:
        singleLine = singleLine.replace("'","")
        singleLine = singleLine.lower()
        resultingLine = (re.findall(pattern, singleLine))

        for word in resultingLine:
            allTextArray.append(word)
            allText.writelines(word)
            allText.writelines("\n")
    
    # get dictionary of frequencies of words
    allTextSet = set(allTextArray)
    allTextDict = {}

    for wordSet in allTextSet:
        for wordArray in allTextArray:
            if wordSet == wordArray:
                if wordSet in allTextDict:
                    allTextDict[wordSet] = allTextDict[wordSet] + 1
                else :
                    allTextDict[wordSet] = 1
    
    # unique words
    for key, value in allTextDict.items():
        if 1 == value:
            uniqueWordsArray.append(key)
            uniqueWords.writelines(key)
            uniqueWords.writelines("\n")

    # frequencies of words
    frequencyDict = {}
    for i in range(len(allTextDict)):
        
        wordFreq = list(allTextDict.values())[i]

        if wordFreq in frequencyDict:
            frequencyDict[wordFreq] += 1
        else:
            frequencyDict[wordFreq] = 1
    
    sortedFrequencyDict = sorted(frequencyDict.items(), key = lambda x:x[1], reverse=True)
    finalDict = dict(sortedFrequencyDict)
    
    for key, value in finalDict.items():
        wordFrequency.write('%s:%s\n' % (key, value))
        wordFrequency.writelines("\n")

    

if __name__ == "__main__":
    openfile()
