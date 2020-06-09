
# Don't run in the middle of deployment

# # # # # # # # # # # # # # # # # # # # # # #
# Application Specific

User.destroy_all()

User.create!(
  email: "adel.muursepp@gmail.com",
  password: "passwordpassword",
  password_confirmation: "passwordpassword",
  roles: "site_admin"
)

puts "#{User.count} users created."



# # # # # # # # # # # # # # # # # # # # # # #
# Blogs

Blog.destroy_all()

Topic.destroy_all()

Topic.create!(title: "Art")
Topic.create!(title: "Coding")
Topic.create!(title: "Philosophy")

puts "#{Topic.count} topics created."

Blog.create!(
  title: Faker::Lorem.words(5).join(" ").titlecase,
  body: Faker::Lorem.paragraphs(3).join("\n\n"),
  topic_id: Topic.last.id,
  status: rand(0..1)
)

puts "#{Blog.count} blog posts created."


1.times do
    Comment.create!(
        content: Faker::Lorem.words(15).join(" "),
        user_id: User.last.id,
        blog_id: Blog.last.id
    )
end

puts "#{Comment.count} comments created."



# # # # # # # # # # # # # # # # # # # # # # #
# Boot camp prep

ResourceItem.destroy_all()
ResourceTopic.destroy_all()
ResourceCategory.destroy_all()


ResourceCategory.create!(title: "Coding- iOS")
ResourceCategory.create!(title: "Coding- Rails")
ResourceCategory.create!(title: "Coding- Python")

puts "#{ResourceCategory.count} resource categories created."




# ResourceTopic.create!(title: "Rails Boot Camp Prep",
#                       intro: "Materials for preparing for Ruby on Rails boot camp.",
#                       resource_category_id: ResourceCategory.last.id)

ResourceTopic.create!(title: "Learning Python",
                      intro: "Materials for learning Python from the basics",
                      resource_category_id: ResourceCategory.last.id)

puts "#{ResourceTopic.count} resource topics created."

markdown_sample = '# h1 Heading
## h2 Heading
### h3 Heading 😁
#### h4 Heading
##### h5 Heading
###### h6 Heading

😂👩🏻‍💻

## Horizontal Rules

___

---

***


## Typographic replacements
&copy;



## Emphasis

**This is bold text**

__This is bold text__

*This is italic text*

_This is underlined text_

~~Strikethrough~~


## Quotes

This is a "quote".



## Blockquotes


> Blockquotes can be included by using greater-than signs right next to the quotes.


## Lists

Unordered

+ Create a list by starting a line with `+`, `-`, or `*`
+ Sub-lists are made by indenting 2 spaces:
  - Marker character change forces new list start:
    * Ac tristique libero volutpat at
    + Facilisis in pretium nisl aliquet
    - Nulla volutpat aliquam velit
+ Very easy!

Ordered

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa


1. You can use sequential numbers...
1. ...or keep all the numbers as `1.`



## Code

Inline `code`

Indented code

    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code


Block code "fences"

```
Sample text here...
```

Syntax highlighting

``` js
var foo = function (bar) {
  return bar++;
};

console.log(foo(5));
```

## Tables

| Column A | Column B | Column C |
|----------+----------+----------|
| Cell A1  | Cell B1  | Cell C1  |
| Cell A2  | Cell B2  | Cell C2  |
| Cell A3  | Cell B3  | Cell C3  |

| Column A | Column B | Column C |
|----------|----------|----------|
| Cell A1  | Cell B1  | Cell C1  |
| Cell A2  | Cell B2  | Cell C2  |
| Cell A3  | Cell B3  | Cell C3  |


## Links

[link text](http://dev.nodeca.com)

[link with title](http://nodeca.github.io/pica/demo/ "title text!")

Autoconverted link https://github.com/nodeca/pica (enable linkify to see)


## Images

![Minion](https://octodex.github.com/images/minion.png)
![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")

Like links, Images also have a footnote style syntax

![Alt text][id]

With a reference later in the document defining the URL location:

[id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"



### Superscript

- 19^th


### \<mark>

==Marked text==


### Footnotes

Footnote 1 link[^1].

Footnote 2 link[^2].

[^3]: Text of inline footnote definition.

Another footnote link[^3]. Duplicated footnote reference[^2].

[^1]: Footnote **can have markup**

    and multiple paragraphs.

[^2]: Footnote text.'

introduction_item = '
---
Here is some of my advice and resources I wish I had known before boot camp.
Preparing for boot camps is not necessary, you would finish the boot camp anyway, however there is absolutely no limit to being prepared. The more you know, the more you will find coding fun and gain a better understanding.

**Disclaimer:** As I am a person who wanted to be extremely prepared, I would do tens of courses, memorize everything and during boot camp not sleep to make sure I was on top of the material. This is in no way necessary, but I have to admit, extra work paid off. 📚 Point is: just do as much as you can and don\'t stress about being unprepared - I promise some people will have done nothing, you are already fine!💪

**Using resources while website is developed:**
+ If the link doesn\'t work, go to the Home page and use the links to go to Resources.
+ When you get errors on clicking random stuff on website, just go to Home page and find Resources 😊
+ Website isn\'t yet configured for the phone
+ Tell me what is the error and I\'ll help out!


**Some proposals for covering material**
+ Let me know if you want me to explain the slides so you can take notes at the same time or you want to do it before and we can practise it in the terminal. However you learn best.
+ I think bigger periods between classes leave room for homework and in the end more material can be learned (like a week?). However, if you don\'t like learning alone with homework, shorter periods also work.
'

topic_1 = '
---
### Objectives
+ Understand that computers communicate through windows called terminals
+ Know how to manipulate and move between files


### Homework
Learn to use terminal on your computer. The excellent link for learning: [Terminal basics](https://www.learnenough.com/command-line-tutorial/basics)
**How?** Learning about terminal is where you want to **memorize** words. I went through every page of tutorial, wrote flash cards about every command and made sure I knew everything from memory. It is not necessary to study so much 🤓 but in the end I could actually somehow understand what was going on in the boot camp.
'


topic_2 = '
---
### Objectives
+ Understand how to use logic when talking to computer (`if` this `then` do this)


### Learning
**Why?** Understand the theory for Codecademy exercises, feel comfortable thinking like a programmer
**How?** Remember the material and try to use in the terminal
Link to Conditional Statements lecture (use the arrow down): [Conditional statements](https://rubygarage.github.io/slides/ruby-basics#/14)

### Homework
Doing Codecademy exercises.
**How?** Practicing and using Ruby documentation.


'

topic_3 = '
---
### Objectives
+ Understand the differencwe between defining and calling methods
+ Understand arguments and parameters
+ Understand that methods are used for saving logic


### Learning
**Why?** Every coding language has methods and this allows you to structure your code
**How?**
Link to Methods lecture (use the arrow down): [Methods](https://rubygarage.github.io/slides/ruby-basics#/15)


### Materials

Finding the leap year: [Microsoft guide for leap year](https://docs.microsoft.com/en-us/office/troubleshoot/excel/determine-a-leap-year)

```ruby
year = 2020

def divisible_by_4(year)
  if year % 4 == 0
    divisible_by_100(year)
  else
    # to let know that it is not a leap year
    false
  end
end


def divisible_by_100(year)
  if year % 100 == 0
    divisible_by_400(year)
  else
    true
  end
end


def divisible_by_400(year)
  if year % 400 == 0
    true
  else
    false
  end
end

print(divisible_by_4(year))
```

### Homework
Reviewing, look at the slides if you have time


'


topic_4 = '
---
### Objectives
+ Understand that Ruby has different classes: String, Integer, Array, ...
+ Know how to switch between classes using .to_a, .to_i, .to_s
+ Know that each class has different methods and they can be looked up here: [Ruby documentation](https://ruby-doc.org/core-2.6.5/) 👈 Yes, you do have to look it up yourself, **nobody** will be very happy to explain stuff that is in the docs already.


### Learning
**Why?** Remember talking about OOP? Object oriented programming is the most important principle to master and classes are what make up OOP.
**How?** I know that I like writing conspect to notebook far more than an average person. I think I got two full notebooks for Ruby conspect. This is why I would recommend writing it up and memorizing, but if you think you remember theory somehow else, use your own methods 📓
Link to Ruby basic classes lecture: [Ruby basic classes](https://rubygarage.github.io/slides/ruby-basics#/3/1)
Link to using Number class: [Ruby Numbers](http://rubylearning.com/satishtalim/numbers_in_ruby.html)

### Homework
Doing Codecademy exercises.
**How?** Practicing and using Ruby documentation.


### Extra
Subscribe to Ruby weekly newsletter: [Ruby Newsletter link](https://rubyweekly.com/)
Fast explanation of OOP in Ruby: [OOP in Ruby](https://launchschool.com/books/oo_ruby/read/the_object_model#whyobjectorientedprogramming)
'


topic_5 = '
---
### Objectives
+ Understand what is Git and Github
+ Make a Github account


### Learning
**Why?** Understand what Git is used for
**How?** Write a conspect for the slides and print out/write out on paper the commands so you have it by your side when you need it (everyone does so). Ask me what is kind of messy or look up on Youtube.
Link to Github lecture: [Github theory](https://rubygarage.github.io/slides/git/basics#/)

### Homework
Cloning a project and committing (done!)
**How?** Using Github slides and learned commands


### Fast Cheat Sheet

| Command | Description |
----------+-------------|
| ==git clone== | clone repository into a local directory |
| ==git init== | repository setup, start git |
| ==git pull== | take code from internet, from your account |
| ==git add== | add files to queue for next commit |
| ==git commit== | commit added files |
| ==git log== | view a log of commits |
| ==git push== | push commit(s) to remote repository on your account |
| ==git status== | show uncommited changes |

*Material used from: RubyGarage*
'



hands_on_item = '
---
It is very nice to try out some of the trillion tools you will be using during two monts.
No worries, it is not about learning 10 new languages, just little extras that I wish I would have known how to use during camp.

### __Projects to try__

#### Try to make a Figma app prototype

**Why?** Figma is the application to make design for your app. When developing apps, you will probably have a day to make a design for the app. Not being able to place everything and make use of it will frustrate you a little and will give not so nice design.

**What?** Make an app for bike rental, dog walking. I made a dating app for example... A dating app for a client on Figma: [Dating app link](https://www.figma.com/file/uKIw2CtcWRFfzVyzd2Jwb2/dating-ios)

Hint: There are also beautiful templates that you can download and make use of


#### Try to put a very easy Rails app on web

**Why?** It is a sneak peek into what will be coming. It is just interesting to know what you will be working towards 🧑‍💻

**What?** Very easy basic commands. Using Rails Girls tutorial that is available here:
[Easy Rails tutorial](http://guides.railsgirls.com/app)


#### Complete Ruby on Rails 101 Challenges

**Why?** Understand what it means when you will be submitting all the questions in the boot camp. It is also the best way to actually practice git. This is also where people get most confused and very angry because they really don\'t understand what is going on. It is very important to understand how git works.

**What?** Le Wagon has some public exercises on Github that anyone can try out. They are in the same format as the ones you will be doing. Using them, however, requires Ruby up and running on your machine.
Link: [Ruby 101 Challenges link](https://github.com/lewagon/ruby-101-challenges)
'

tips_item = '
---
### Tips for learning how to code better

Those are not necessary but all useful👍✨

+ Stay curious. Coding requires discipline in the beginning. It seems like regular boring work at times. But actually it is the best possible work you could have- you are learning about how our entire world is put on internet and building apps like none of your friends are able to. Get interested and google everything that you want to ask, try to know more than is needed - this way you are not only remembering text, but understanding what you are building. Some of my favourite googlings: [What is browser?](https://developers.google.com/web/updates/2018/09/inside-browser-part1), [How internet works?](http://www.steves-internet-guide.com/http-basics/)

+ Try to read Medium articles about coding (maybe every day?). Medium is the place where you can catch up with trends in the code world and sound smart when talking to professional developers😉 Try out little tutorials about terminal for example. As I do Data Science, I follow Towards Data Science thread. Try it out: [Medium](medium.com)

+ Think how you can make flash cards for yourself easily - coding is like a language, you need to memorize words to be able to speak it. I would personally do 50 flash cards **every day**. And then review them. Although paper works, I think Flash Cards Go is a decent app as well 👈

+ Learn to type using all ten fingers just right and practise typing as much as possible (It is a good motivation for dull work on Word 🤓). [Keybr](keybr.com) is the absolute best for practise. Another thing you can do, is to make your keys different color for each finger. As I didn\'t want to do it, I drawed a colorful keyboard on paper and practiced on it. 💁‍♀️

+ Know how to find all the symbols on keyboard. Keyboard map works well, but know how to use Keyboard Viewer.

+ Learn basic Spectacle short cuts so you can fit multiple screens easily and be a more efficient coder💪

+ Drop Safari. No other browser than Chrome will be used for two months. If you want, remember a couple short cuts that you like using in Chrome.

+ Post a question on Stack Overflow. Stack Overflow and its coding community will be your best friend for the time. It is nice to get used to it and know how to find answers. (For example I got my whole project fixed by a random dude)

+ If you **really** love using a mouse with computer, you can do it. It is not common though, better and faster is to navigate with shortcuts than clicking on pages.
'


python_1 =

# # # # # # # # # # # # # # # # # # # # # Ruby

# ResourceItem.create!(title: 'Introduction',
#                       body: introduction_item,
#                       resource_topic_id: ResourceTopic.last.id)

# ResourceItem.create!(title: 'Topic 1. Using Terminal',
#                       body: topic_1,
#                       resource_topic_id: ResourceTopic.last.id)

# ResourceItem.create!(title: 'Topic 2. Conditional Statements',
#                       body: topic_2,
#                       resource_topic_id: ResourceTopic.last.id)

# ResourceItem.create!(title: 'Topic 3. Learning methods',
#                       body: topic_3,
#                       resource_topic_id: ResourceTopic.last.id)

# ResourceItem.create!(title: 'Topic 4. Learning Ruby Classes',
#                       body: topic_4,
#                       resource_topic_id: ResourceTopic.last.id)

# ResourceItem.create!(title: 'Topic 5. Using Github',
#                       body: topic_5,
#                       resource_topic_id: ResourceTopic.last.id)

# # ResourceItem.create!(title: "Rails Boot Camp Prep",
# #                       body: markdown_sample,
# #                       resource_topic_id: ResourceTopic.last.id)

# ResourceItem.create!(title: "Hands on practicing",
#                       body: hands_on_item,
#                       resource_topic_id: ResourceTopic.last.id)

# ResourceItem.create!(title: "Tips",
#                       body: tips_item,
#                       resource_topic_id: ResourceTopic.last.id)


# # # # # # # # # # # # # # # # # # # # # Python

python_introduction = '
---

Here will be gathered the materials for the classes

**Using resources while website is developed:**
+ If the link doesn\'t work, go to the Home page and use the links to go to Resources.
+ When you get errors on clicking random stuff on website, just go to Home page and find Resources 😊
+ Website isn\'t yet configured for the phone
+ Tell me what is the error and I\'ll help out!

'

python_resources = '
---

Tartu University Python text book in Estonian that I used to learn Python: [Pythoni õpik](https://progeopik.cs.ut.ee/01_sissejuhatus.html)
Quite fine Python textbook: [Practical Python](https://www.brianheinold.net/python/A_Practical_Introduction_to_Python_Programming_Heinold.pdf)
'

python_1 = '
---

### Objectives
+ Learn how to use Pycharm for coding

### Getting Started
+ This is the Welcome Screen for
PyCharm.
![PyCharm](https://resources.jetbrains.com/help/img/idea/2019.3/py_QST_WelcomeScreen.png)
+ You will see this when you
open the IDE without a project
open.
+ To start this tutorial, please
press Create New Project.
+ You can open an existing
project by hitting “Open”.

### Creating a Project
+ The first thing you will need to
do is type in your program
name.
+ You can name it
my_first_program or any
other name that you desire.
+ After typing in your program
name, hit the create button
'

python_2 = '
---

### Basics of a program

```python
temp = int(input("Enter a temperature in Celsius: ""))
print("In Fahrenheit, that is", 9/5*temp+32)
```

### Typing things in

**Case** Case matters. To Python, print, Print, and PRINT are all different things. For now, stick
with lowercase as most Python statements are in lowercase.
**Spaces** Spaces matter at the beginning of lines, but not elsewhere. For example, the code below
will not work.
```python
temp = int(input("Enter a temperature in Celsius: ))
          print("In Fahrenheit, that is", 9/5*temp+32)
```
Python uses indentation of lines for things we’ll learn about soon. On the other hand, spaces in
most other places don’t matter. For instance, the following lines have the same effect:
```python
print("Hello world!")
print ("Hello world!")
print( "Hello world!" )
```
Basically, computers will only do what you tell them, and they often take things very literally.
Python itself totally relies on things like the placement of commas and parentheses so it knows
what’s what. It is not very good at figuring out what you mean, so you have to be precise. It will
be very frustrating at first, trying to get all of the parentheses and commas in the right places, but
after a while it will become more natural. Still, even after you’ve programmed for a long time, you
will still miss something. Fortunately, the Python interpreter is pretty good about helping you find
your mistakes.

### Materials
Lecture 1: [Types, variables](http://slides.com/josearrieta-1/class1#/0/1)
Lecture 2: [If-Elif and more](http://slides.com/josearrieta-1/class2#/0/1)

### Task - Create a calculator

**Solution**
To be posted soon ...🙃
Hint: Check that you are performing math operations not in quotes (a+b)
'

python_3 = '


### Task - Create an ATM

**Solution**
```python
balance=1000
print("    ATM    ")
print("""
1)        Balance
2)        Withdraw
3)        Deposit
4)        Quit


""")
Option=int(input("Enter Option: "))

if Option==1:
    print("Balance  € ",balance)


if Option==2:
    print("Balance  €  ",balance)
    Withdraw=float(input("Enter Withdraw amount € "))
    if Withdraw>0:
        balance=(balance-Withdraw)
        print("Current Balance  € ",balance)
    elif Withdraw>balance:
        print("No funds in account")
    else:
        print("None withdraw made")

if Option==3:
    print("Balance  € ",balance)
    Deposit=float(input("Enter deposit amount € "))
    if Deposit>0:
        balance=(balance+Deposit)
        print("Current balance  € ",balance)
    else:
        print("None deposit made")


if Option==4:
    exit()
```

**Advanced solution**
```python
balance=1000
Option = 0

while Option != 4:
    print("    ATM    ")
    print("""
    1)        Balance
    2)        Withdraw
    3)        Deposit
    4)        Quit


    """)
    Option=int(input("Enter Option: "))

    if Option==1:
        print("Balance  € ",balance)


    if Option==2:
        print("Balance  €  ",balance)
        Withdraw=float(input("Enter Withdraw amount € "))
        if Withdraw>0:
            balance=(balance-Withdraw)
            print("Current Balance  € ",balance)
        elif Withdraw>balance:
            print("No funds in account")
        else:
            print("None withdraw made")

    if Option==3:
        print("Balance  € ",balance)
        Deposit=float(input("Enter deposit amount € "))
        if Deposit>0:
            balance=(balance+Deposit)
            print("Current balance  € ", balance)
        else:
            print("None deposit made")


    if Option==4:
        exit()
```

'

ResourceItem.create!(title: 'Introduction',
                      body: python_introduction,
                      resource_topic_id: ResourceTopic.last.id)

ResourceItem.create!(title: 'Resources',
                      body: python_resources,
                      resource_topic_id: ResourceTopic.last.id)

ResourceItem.create!(title: 'Topic 1. Using Pycharm',
                      body: python_1,
                      resource_topic_id: ResourceTopic.last.id)

ResourceItem.create!(title: 'Topic 2. Python Basics',
                      body: python_2,
                      resource_topic_id: ResourceTopic.last.id)



puts "#{ResourceItem.count} resource items created."






