PROGRAM ?= bh

ECLIPSE_HOME ?= $(HOME)/apps/eclipse/installations/latest

ECLIPSE = $(ECLIPSE_HOME)/eclipse

DEPENDENCIES_FOLDER = ../dependencies

# See
# http://www.peterfriese.de/formatting-your-code-using-the-eclipse-code-formatter/
ECLIPSE_JAVA_CODE_FORMATTER =\
			     $(DEPENDENCIES_FOLDER)/google-styleguide/variants/eclipse-java-google-style/.settings/org.eclipse.jdt.core.prefs

ECLIPSE_OPTS = -nosplash -application org.eclipse.jdt.core.JavaCodeFormatter\
	       -config $(ECLIPSE_JAVA_CODE_FORMATTER)

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

format: $(JAVA_FILES)

	$(ECLIPSE) $(ECLIPSE_OPTS) $(JAVA_FILES)


$(JAR_FILE): $(JAVA_FILES) format

	$(MKDIR) -p $(CLASS_FOLDER)

	$(JAVAC) $(JAVAC_OPTS) -d $(CLASS_FOLDER) $(JAVA_FILES)

	$(JAR) $(JAR_OPTS) $(JAR_FILE) $(CLASS_FOLDER)/*.class

clean:

	$(RM) -rf $(CLASS_FOLDER) $(JAR_FILE)

