def read_Cobol():
    print("Reading from inputToTranslator.txt...")

    f = open("outputFiles/inputToTranslator.txt", "r")
    cobolLines = f.read()
    f.close()
    return cobolLines


def write_Java(text):
    print("Writing to outputFromTranslator.txt...")

    f = open("outputFiles/outputFromTranslator.txt", "w")
    f.write(text)
    f.close()

def read_Java():
    print("Reading from outputFromTranslator.txt...")

    f = open("outputFiles/outputFromTranslator.txt", "r")
    javaLines = f.read()
    f.close()
    return javaLines

def append_Java(text):
    print("Appending to outputJavaTranslation.txt...")

    f = open("outputFiles/outputJavaTranslation.txt", "a")
    f.write(text + "\n")
    f.close()



###############  MAIN  ###############

if __name__ == "__main__":


    print("\n############  Start Python  ############")

    cobolLines = read_Cobol()
    
    javaLines = cobolLines #Machine Learning here

    write_Java(javaLines)

    javaCode = read_Java()

    append_Java(javaCode)

    print("############  End Python  ############\n")