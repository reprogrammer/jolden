PROGRAM ?= bh

RM = rm

MKDIR = mkdir

JAVAC = javac

JAVAC_OPTS = -g

JAR = jar

JAR_OPTS = cf

JAVA_FOLDER = src

CLASS_FOLDER = bin

JAVA_FILES = $(wildcard $(JAVA_FOLDER)/*.java)

JAR_FILE = $(PROGRAM).jar

all : $(JAR_FILE)

$(JAR_FILE): $(JAVA_FILES)

	$(MKDIR) -p $(CLASS_FOLDER)

	$(JAVAC) $(JAVAC_OPTS) -d $(CLASS_FOLDER) $(JAVA_FILES)

	$(JAR) $(JAR_OPTS) $(JAR_FILE) $(CLASS_FOLDER)/*.class

clean:

	$(RM) -rf $(CLASS_FOLDER) $(JAR_FILE)
