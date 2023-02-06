import re

def openfile():
    file = open("Assignment3/TheProjectGutenbergeBookofTheTime.txt",  encoding="utf8")
    pattern = '[a-z]+'
    allTextArray = []
    uniqueWordsArray = []

    # write in files
    allText = open("Assignment3/allwords.txt", "w")
    uniqueWordsTxt = open("Assignment3/a3_novelvisualization/uniquewords.txt" , "w")
    wordFrequency = open("Assignment3/a3_wordfrequency/wordfrequency.txt", "w")

    for singleLine in file.readlines():
        singleLine = singleLine.replace("'","")
        singleLine = singleLine.lower()
        resultingLine = (re.findall(pattern, singleLine))

        for word in resultingLine:
            allTextArray.append(word)
            allText.writelines(word)
            allText.writelines("\n")
    
    # get dictionary of frequencies of words
    wordSet = set(allTextArray)
    allTextDict = {}

    # Creating allTextDict (contains frequency)
    for word in wordSet:
        for wordArray in allTextArray: 
            if word == wordArray:
                if word in allTextDict:
                    allTextDict[word] = allTextDict[word] + 1
                else :
                    allTextDict[word] = 1
    
    # unique words
    for key, value in allTextDict.items():
        if value == 1:
            uniqueWordsArray.append(key)
            uniqueWordsTxt.writelines(key)
            uniqueWordsTxt.writelines("\n")

    # frequencies of words
    frequencyDict = {}

    # for word in allTextArray:


    for i in range(len(allTextDict)):
        wordFreq = list(allTextDict.values())[i]
        if wordFreq in frequencyDict:
            frequencyDict[wordFreq] += 1
        else:
            frequencyDict[wordFreq] = 1
    
    sortedFrequencyDict = sorted(frequencyDict.items(), key = lambda x:x[1], reverse=True)
    finalDict = dict(sortedFrequencyDict)
    
    for key, value in finalDict.items():
        wordFrequency.write('%s: %s\n' % (key, value))
    

if __name__ == "__main__":
    openfile()
