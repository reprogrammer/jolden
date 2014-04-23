PROGRAM ?= em3d

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

LIB_FOLDER = lib

JAVAC_JAR = $(LIB_FOLDER)/javac.jar

QUALIFIERS_JAR = $(LIB_FOLDER)/checker-qual.jar

CLASSPATH = .classpath

PROJECT = .project

ECLIPSE_TEMPLATES_FOLDER = ../eclipse-project-templates

TEMPLATE_JAVAC_JAR = $(ECLIPSE_TEMPLATES_FOLDER)/$(JAVAC_JAR)

TEMPLATE_QUALIFIERS_JAR = $(ECLIPSE_TEMPLATES_FOLDER)/$(QUALIFIERS_JAR)

TEMPLATE_CLASSPATH = $(ECLIPSE_TEMPLATES_FOLDER)/$(CLASSPATH)

TEMPLATE_PROJECT = $(ECLIPSE_TEMPLATES_FOLDER)/$(PROJECT)

all : $(JAR_FILE)

format: $(JAVA_FILES)

	$(ECLIPSE) $(ECLIPSE_OPTS) $(JAVA_FILES)

$(JAR_FILE): $(JAVA_FILES) format

	$(MKDIR) -p $(CLASS_FOLDER)

	$(JAVAC) $(JAVAC_OPTS) -d $(CLASS_FOLDER) $(JAVA_FILES)

	$(JAR) $(JAR_OPTS) $(JAR_FILE) $(CLASS_FOLDER)/*.class

eclipse: $(JAVAC_JAR) $(QUALIFIERS_JAR) $(CLASSPATH) $(PROJECT) $(SETTINGS)

$(JAVAC_JAR): $(TEMPLATE_JAVAC_JAR)

	mkdir -p $(LIB_FOLDER)

	cp $(TEMPLATE_JAVAC_JAR) $(JAVAC_JAR)

$(QUALIFIERS_JAR): $(TEMPLATE_QUALIFIERS_JAR)

	mkdir -p $(LIB_FOLDER)

	cp $(TEMPLATE_QUALIFIERS_JAR) $(QUALIFIERS_JAR)

$(CLASSPATH): $(TEMPLATE_CLASSPATH)

	cp $(TEMPLATE_CLASSPATH) $(CLASSPATH)

$(PROJECT): $(TEMPLATE_PROJECT)

	cat $(TEMPLATE_PROJECT) | sed 's/ProjectName/jolden-$(PROGRAM)/' > $(PROJECT)

clean:

	$(RM) -rf $(CLASS_FOLDER) $(JAR_FILE) $(LIB_FOLDER) $(PROJECT)\
		$(CLASSPATH)

