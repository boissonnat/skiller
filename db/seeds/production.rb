#encoding: utf-8

################
# Create Users #
################
if User.where(email: 'contact@skiller.fr').blank?
  admin = User.create!({:email => 'contact@skiller.fr', :password => 'password', :password_confirmation => 'password' })
  admin.roles << Role.find_by(:name => Role::ORGANIZATION_ADMIN)
  admin.save
end


############################
# Create Application areas #
############################
ApplicationArea.find_or_create_by(name: 'Java')
ApplicationArea.find_or_create_by(name: 'Php')
ApplicationArea.find_or_create_by(name: 'Scrum')
ApplicationArea.find_or_create_by(name: 'PM')
ApplicationArea.find_or_create_by(name: 'Misc')

#################################
# Create some default questions #
#################################
## Java
Question.find_or_create_by(user: admin ,is_private: false, title: 'What do you know about Java?', right_answer: 'Java is a high-level programming language originally developed by Sun Microsystems and released in 1995. Java runs on a variety of platforms, such as Windows, Mac OS, and the various versions of UNIX.', application_area: ApplicationArea.find_by(name: 'Java'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'What is Java Virtual Machine and how it is considered in context of Java’s platform independent feature?', right_answer: 'When Java is compiled, it is not compiled into platform specific machine, rather into platform independent byte code. This byte code is distributed over the web and interpreted by virtual Machine (JVM) on whichever platform it is being run.', application_area: ApplicationArea.find_by(name: 'Java'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'What is an Exception?', right_answer: "An exception is a problem that arises during the execution of a program. Exceptions are caught by handlers positioned along the thread's method invocation stack.", application_area: ApplicationArea.find_by(name: 'Java'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'What is Polymorphism?', right_answer: "Polymorphism is the ability of an object to take on many forms. The most common use of polymorphism in OOP occurs when a parent class reference is used to refer to a child class object.", application_area: ApplicationArea.find_by(name: 'Java'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'Define immutable object?', right_answer: "An immutable object can’t be changed once it is created.", application_area: ApplicationArea.find_by(name: 'Java'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'Why Generics are used in Java?', right_answer: "Generics provide compile-time type safety that allows programmers to catch invalid types at compile time. Java Generic methods and generic classes enable programmers to specify, with a single method declaration, a set of related methods or, with a single class declaration, a set of related types.", application_area: ApplicationArea.find_by(name: 'Java'))

## Php
Question.find_or_create_by(user: admin ,is_private: false, title: 'What’s the difference between include and require?', right_answer: " It’s how they handle failures. If the file is not found by require(), it will cause a fatal error and halt the execution of the script. If the file is not found by include(), a warning will be issued, but execution will continue.", application_area: ApplicationArea.find_by(name: 'Php'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'Would I use print "$a dollars" or "{$a} dollars" to print out the amount of dollars in this example?', right_answer: " In this example it wouldn’t matter, since the variable is all by itself, but if you were to print something like \"{$a},000,000 mln dollars\", then you definitely need to use the braces.", application_area: ApplicationArea.find_by(name: 'Php'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'When are you supposed to use endif to end the conditional statement?', right_answer: "When the original if was followed by : and then the code block without braces.", application_area: ApplicationArea.find_by(name: 'Php'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'What’s the difference between accessing a class method via -> and via ::?', right_answer: ":: is allowed to access methods that can perform static operations, i.e. those, which do not require object initialization.", application_area: ApplicationArea.find_by(name: 'Php'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'Are objects passed by value or by reference?', right_answer: "Everything is passed by value.", application_area: ApplicationArea.find_by(name: 'Php'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'What’s the difference between md5(), crc32() and sha1() crypto on PHP?', right_answer: "The major difference is the length of the hash generated. CRC32 is, evidently, 32 bits, while sha1() returns a 128 bit value, and md5() returns a 160 bit value. This is important when avoiding collisions.", application_area: ApplicationArea.find_by(name: 'Php'))

## Scrum
Question.find_or_create_by(user: admin ,is_private: false, title: 'What is Scrum?', right_answer: "Scrum is an iterative and incremental agile software development method for managing software projects and product or application development.", application_area: ApplicationArea.find_by(name: 'Scrum'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'What is the difference between agile and scrum development?', right_answer: "Agile and Scrum are terms used in project management. The Agile methodology employs incremental and iterative work beat that are also called sprints. Scrum, on the other hand is the type of agile approach that is used in software development.Agile itself is not a specific way of working, it is generic set of principles or priorities which are outlined in the Agile Manifesto.", application_area: ApplicationArea.find_by(name: 'Scrum'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'What are the dis-advantages of Scrum?', right_answer: "It can be difficult for the Scrum master to plan, structure and organize a project that lacks a clear definition. In addition, frequent changes, frequent product delivery and uncertainty regarding the precise nature of the finished product make for a rather intense project life cycle for everyone involved. Furthermore, the daily Scrum meetings and frequent reviews require substantial resources. ", application_area: ApplicationArea.find_by(name: 'Scrum'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'What is a Sprint?', right_answer: "A sprint is the basic unit of development in Scrum. Sprints last between one week and one month, and are a 'timeboxed' (i.e. restricted to a specific duration) effort of a constant length. Each sprint is preceded by a planning meeting, where the tasks for the sprint are identified and an estimated commitment for the sprint goal is made, and followed by a review or retrospective meeting, where the progress is reviewed and lessons for the next sprint are identified.", application_area: ApplicationArea.find_by(name: 'Scrum'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'What are types of roles in scrum?', right_answer: "Scrum teams consist of two types of roles: Main / Core Roles ; Ancillary Roles ; Main / Core roles are often referred to as pigs and ancillary roles as chickens (after the story 'The Chicken and the Pig'", application_area: ApplicationArea.find_by(name: 'Scrum'))
Question.find_or_create_by(user: admin ,is_private: false, title: 'What is Burn down?', right_answer: 'The sprint burn down chart is a publicly displayed chart showing remaining work in the sprint backlog. Updated every day, it gives a simple view of the sprint progress. It also provides quick visualizations for reference.', application_area: ApplicationArea.find_by(name: 'Scrum'))
