import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/model/activity.dart';
import '../../../data/model/experience.dart';
import '../../../data/model/project_info.dart';
import '../../../data/model/quote.dart';
import '../../../data/model/route_model.dart';
import '../../../data/model/showcase_project.dart';
import '../../../data/model/social_media.dart';
import '../../route/routes.dart';
import 'constant_assets.dart';
import 'constant_color.dart';
import 'constant_sizes.dart';

/// constant strings are prefixed with [ks]
const String ksFontFamily = "ShantellSans";

const String hi = "Hi";
const String iam = "I'm Suraj";
const String fullstackdeveloper = "Software Developer";
const String ksTechNerd = "a  tech  nerd";
const String ksFlutterDev = "flutter  dev";
const String coffeeAddict = "coffee addict";
const String ksIntrovert = "an introvert";
const String ksIm = "I'm";
const String ksIntro = """
    - a passionate mobile developer
    - an web developer
    - a strong curiosity for coding
    - an avid reader
  """;
const String ksSeeMyWork = "See my work";
const String ksBrowseProjects = "Browse My Projects";
const String ksHome = "Home";
const String ksAbout = "About";
const String ksExperience = "My Experience";
const String ksProject = "My Projects";
const String ksViewProject = "View Project";
const String ksCraftedWithLove = "Crafted with Love";
const String ksRecentProjects = "Here are a selection of my recent projects";
const String ksCraftedProjects =
    'Here are some of my carefully crafted projects';
const String ksContact = "Contact Me";
const String ksAboutMe = "About Me";
const String ksBgStory = "Background Story";
const String ksTools = "Tools & Technology";
const String ksAllAboutMe = "All About Me";
const String ksGithub = "Github";
const String ksLinkedIn = "LinkedIn";
const String ksDiscord = "Discord";
const String ksSendMessage = 'Send Message';

const String ksSlash = "/";
const String ksLetsWork = "Let's work together!";
const String ksFreelanceAvailability = "I'm available for Freelancing";
const String ksContactInfo = "- Contact Info";
const String ksWorkEmail = "shining.surajchauhan@gmail.com";
const String ksWorkPhone = "+91 9785700328";
const String ksCreditTo = "- Big Thanks";
const String ksDavidCobbina = "David Cobbina";
const String ksDavidCobbinaWebsite = "https://davidcobbina.com/";
const String ksJuliusG = "Design by Julius G";
const String ksJuliusGWebsite =
    "https://www.behance.net/gallery/63574251/Personal-Portfolio-Website-Design";
const String ksBuildUsing = "Build using ";
const String ksWithMuch = " with much ";
const String ksCC = "©️ 2023 Ye Lwin Oo";
const String ksYoung = "When I was young, I was a kid!";
const String ksNobody = "I'm NOBODY";
const String ksSpecialization =
    "I specialize in Website and Mobile Technologies and highly passionate about developing quality of applications.";
const String ksWhoAmI = 'Who Am I?';
const String ksWhatILove = "What I Love To Do";
const String ksBriefAboutMe =
    "Hi! this is Suraj chauhan, I'm a Full-stack Software Engineer who is passionate about emerging Technologies and AI. Well-qualified Developer familiar with wide range of programming utilities and languages.  I have fairly extensive 1+ year of experience in developing and building high quality dynamic and scalable web and mobile applications.";
const String ksMyLife =
    "I completed my post-graduation in Computer Applications from NIT Kurukshetra, Haryana, in 2024.";

const String ksProfession =
    "I started working as a Full-stack Developer since 2024. I'm eager to contribute in different projects. Recently, I've worked on two project Faircado (Second hand alternative) and NAIARA - APP (AI powered chatBot) where i worked as a front -end and back-end developer. I am passionate about website and mobile application development.";

const String ksMyTools =
    "I use a bunch of tools and technologies to make design and implementation process easier. ";
const String ksWeapon = "My favorite choice of weapon is ";
const String ksFlutter = "Flutter & Dart";

const String ksMobile = 'Mobile Technologies';
const String ksWebAndOther = 'Web & Other Technologies';
final List<String> ksMobileTech = ['Flutter', 'Dart'];
final List<String> ksWebTech = [
  'HTML',
  'CSS',
  'JavaScript',
  'Express.js',
  'React',
  'Node.js',
  'Java',
  'GoLand'
];
final List<String> ksOtherTech = ['Firebase', 'MongoDB', 'SQL', 'Radix'];

const String ksCoding = "Software Engineering";
const String ksCodingMobile = "Software\nEngineering";
const String ksCoffee = "Coffee";
const String ksReading = "Reading";
const String ksMusic = "80's,90's Music";
const String ksMusicMobile = "80's,90's\nMusic";
const String ksMovie = "Movies";
const String ksExplore = "Exploring more...";
const String ksExploreMobile = "Exploring\nmore...";

final List<RouteModel> ksMenu = [
  RouteModel(label: ksHome, route: Routes.home),
  RouteModel(label: ksProject, route: Routes.projects),
  RouteModel(label: ksExperience, route: Routes.experience),
  RouteModel(label: ksAbout, route: Routes.about),
  RouteModel(label: ksContact, route: Routes.contact),
];

const String ksAwardsAndActivities = "Awards & Activities";
const String ksAward = "Award I've won";
const String ksAwardName =
    "Blind coding context (Apex  institute of management and Science)";
const String ksAwardLink = "https://witaward.com/result/2020";
const String ksAwardDetails = """
- The bigest blind coding contest in Apex Institute of management and Science.
- Achieve the good rank in biggest blind coding contest across over the 150+ participants and solved complex programming challenges under strict time constraints.
- Demonstrated exceptional problem-solving and coding skills without seeing the code output.
""";
const String ksActivities = "Activities I've joined";
final List<Activity> ksActivityList = [
  Activity(
    title: ksAward,
    name: ksAwardName,
    icon: Icons.troubleshoot,
    details: ksAwardDetails,
    // link: ksAwardLink,
  ),
  // Activity(
  //   title: ksActivities,
  //   name:
  //       "TFI SCALE Program (Temasek Foundation International Specialists' Community Action andLeadership Exchange Program - Singapore)",
  //   icon: Icons.local_activity,
  //   details:
  //       "This is a five-week Exchange Program with Singapore Polytechnic ( 3-weeks in Singapore and 2-weeks in Myanmar Learnt data analytics, design thinking and co-operation skills and applied them on the Coffee Farm Project",
  // ),
  // Activity(
  //   name:
  //       "JST Japan-Asia Youth Program (Sakura Science Exchange Program - Japan)",
  //   icon: Icons.local_activity,
  //   details:
  //       "This is a 9-days Exchange Program at Miyakonojo College, Miyazaki, Japan\nLearnt basic IOT and made the POINT Traffic Control System ( Traffic lights control system with extended functionalities such as alerts when driver recklessly drive while red light is on )",
  // ),
];

final List<Experience> ksExperiences = [
  Experience(
    company: "Faircado (Second hand alternative)",
    position: "Front-end Developer",
    responsibilities: [
      "Develop a cross platform mobile application using flutter with multi lang., enabling user to discover and purchase second-hand product effortlessly. ",
      "Integrate Google and Apple Authentication for secure and fast login using firebase.",
      "Users can upload an image, can type the product name to get instant search results.",
      "Integrated a high-performance Search API to deliver fast and accurate product search results.",
      "App suggests similar products using image recognition.",
      "Uses Riverpod for state management, ensuring dynamic UI updates.",
      "Developed a `Favorite Products` feature in mobile application. Users can add/ remove products from favorites section by simply clicking heart icon.",
      "Developed a seamless onboarding experience and user profile management system with multilingual support.",
      "Implemented a smart notification system to alert users when a previously unavailable product becomes available."
    ],
    startDate: DateTime(2024, 06),
    endDate: DateTime(2024, 10),
  ),
  Experience(
    company: "NAIARA App – AI-Powered Chatbot Platform",
    position: "Full-stack developer",
    responsibilities: [
      "In today’s fast-paced world, efficiency is everything, such that we will developed a feature-rich mobile application integrating AI-driven bots to enhance user experience across various domains.",
      "In the NAIARA App, multiple chatbots are integrated, each serving a different purpose.",
      ("""Chat Bots
        ● Personal Assistant/ Secretory bots:
          - In the Personal Assistant Bot of the NAIARA App, various Google APIs have been integrated to 
            enhance productivity and streamline daily tasks:
          - In the Personal Assistant Bot, users can send and receive emails, fetch the latest unread emails, 
            forward, and delete emails effortlessly without leaving the bot.
          - The user can schedule meetings and calendar events with attendees on a specific date and time,
            and a meeting link will be automatically generated and sent as a notification to the attendees.
          - User will be able generate structured Google Docs by providing a summary or brief notes on any 
            topic, making content creation seamless and efficient.
          - Also user can create a perform CURD operation to his Google task and notes.
          
        ● Travel Bots:
          - The Travel Bot allows users to effortlessly search for flights between two locations, specify the 
            number of passengers, specific dates and book their tickets—all within the chatbot interface.
          - Integrate different seating arrangements based on different flights like Indigo, SpiceJet ..
          - User can book their flight either One-way or round trip.
          - Implement radix Database for fast access flights from DB and show to the user.
          
        ● Hotel Bots:
          - The Hotel Bot allows users to effortlessly search for hotels on a specific dates and number of
            passengers.
          
        ● Shopper Bots:
          - Shopper bots allow the Users simply type a product name or upload an image, and our AI Shopper 
            Bot fetches results instantly.
          - Users can view detailed product information, including price, ratings, and specifications, select 
            multiple products, and seamlessly proceed to checkout.
          - Uses Riverpod for state management, ensuring dynamic price and other UI updates.
        """),
      "Implement firebase authentication including Google SSO, Apple, Microsoft and etc with fast and securely login.",
      "Integrate MongoDB database where user can perform CRUD operation."
    ],
    startDate: DateTime(2024, 10),
    endDate: DateTime.now(),
  ),
  Experience(
    company: "OpenBot",
    position: "Web development",
    responsibilities: [
      "Developed and fine-tuned AI model for real-time object detection and path planning.",
      "Design free and membership plan UI to the user.",
      "Integrate stripe payment integration.",
      "Design OpenBot chatBot such that user will chat about robots and discuss about how to control robots.",
    ],
    startDate: DateTime(2024, 2),
    endDate: DateTime(2024, 6),
  ),
];

const String _linusTorvalds = "Linus Torvalds";
const String _donaldKnuth = "Donald Knuth";
const String _albertEinstein = "Albert Einstein";
const String _steveJobs = "Steve Jobs";
final List<Quote> ksQuotes = [
  Quote(
    name: "I'm generally a very pragmatic person: that which works, works.",
    author: _linusTorvalds,
  ),
  Quote(
    name:
        "Everyday life is like programming, I guess. If you love something you can put beauty into it.",
    author: _donaldKnuth,
  ),
  Quote(
    name: "I have no special talent. I am only passionately curious.",
    author: _albertEinstein,
  ),
  Quote(
    name: "Stay hungry, stay foolish.",
    author: _steveJobs,
  ),
];

const String ksFacebookLink = 'https://www.facebook.com/ye.lwin.oo.someone';
const String ksGithubLink = 'https://github.com/Surajchauhan2000';
const String ksLinkedInLink =
    'https://www.linkedin.com/in/suraj-chauhan-39b291228/';
const String ksMediumLink = 'https://yelwino.medium.com/';
const String ksStackoverflowLink =
    'https://stackoverflow.com/users/19209151/ye-lwin-oo';
const String ksDiscordLink = 'https://discordapp.com/users/809527318632071178';
final List<SocialMedia> ksSocialMedia = [
  SocialMedia(
    link: ksFacebookLink,
    icon: FaIcon(
      FontAwesomeIcons.facebook,
      color: kSecondary,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksGithubLink,
    icon: FaIcon(
      FontAwesomeIcons.github,
      color: kSecondary,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksLinkedInLink,
    icon: FaIcon(
      FontAwesomeIcons.linkedin,
      color: kSecondary,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksMediumLink,
    icon: FaIcon(
      FontAwesomeIcons.medium,
      color: kSecondary,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksStackoverflowLink,
    icon: FaIcon(
      FontAwesomeIcons.stackOverflow,
      color: kSecondary,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksDiscordLink,
    icon: FaIcon(
      FontAwesomeIcons.discord,
      color: kSecondary,
      size: s18,
    ),
  ),
];

const String _FLUTTER = 'Flutter';
const String _DART = 'Dart';
const String _REACT = 'React';
const String _FIREBASE = 'Firebase';
const String _HTML = 'Html';
const String _CSS = 'Css';
const String _JAVASCRIPT = 'Javascript';
const String _GRAPHQL = "GraphQL";
const String _ME = 'Ye Lwin Oo';

const String _ANDROID = 'Android';
const String _IOS = 'Ios';
const String _WINDOWS = 'Windows';
const String _LINUX = 'Linux';
const String _MAC = 'MacOs';
const String _WEB = 'Web';
final List<ShowcaseProject> ksShowcaseProjects = [
  ShowcaseProject(
    title: 'Faircado (second-hand alternatives)',
    image: kaPulseX,
    shortDescription: "Find second-hand alternatives when you shop online.",
    description: """
Faircado is a second-hand shopping application available in different platform like android and IOS. Navigate the second-hand universe with tailored suggestions in a browser plugin. Faircado is your sustainable shopping assistant that aggregates and compares all second-hand offers to make you save time, money and CO2:
     
          - Android & iOS Cross-Platform enhancing accessibility and user experience.
          - Integrated Google and Apple Authentication for secure, easy and fast login.
          - Implemented a notification system that alerts users when new second-hand products matching .
        
        """,
    link: ProjectInfo(
      icon: Icons.link,
      label: "Project Links",
      isLink: true,
      contents: [
        "https://pub.dev/packages/pulse_x",
        "https://github.com/YeLwinOo-Steve/pulse_x",
      ],
    ),
    heroTag: 'pulse-x',
    tags: ProjectInfo(
      icon: Icons.tag,
      label: 'Tags',
      isTag: true,
      contents: [
        'package',
        _FLUTTER.toLowerCase(),
        _DART.toLowerCase(),
        'state management',
      ],
    ),
    tech: ProjectInfo(
      icon: Icons.computer,
      label: 'Tools & Technologies',
      contents: [
        _FLUTTER.toUpperCase(),
        _DART.toUpperCase(),
      ],
    ),
    author: ProjectInfo(
      icon: Icons.person,
      label: 'Developer',
      contents: [
        _ME,
      ],
    ),
    platform: ProjectInfo(
      icon: Icons.laptop,
      label: 'Available Platforms',
      contents: [
        _ANDROID,
        _IOS,
        _WEB,
      ],
    ),
    images: [
      "assets/images/projects/faircado/img.png",
      "assets/images/projects/faircado/small_space.png",
      "assets/images/projects/faircado/small_space.png",
      "assets/images/projects/faircado/img1.png",
      "assets/images/projects/faircado/small_space.png",
      "assets/images/projects/faircado/img3.png",
      "assets/images/projects/faircado/large_space.png",
      "assets/images/projects/faircado/img4.png",
      "assets/images/projects/faircado/faircado_awesom.png",
      "assets/images/projects/faircado/our_story.png",
      "assets/images/projects/faircado/not_do.png",
      "assets/images/projects/faircado/img5.png"
    ],
    mobileImages: [
      "assets/images/projects/faircado/faircadoMobileImage/fm1.png",
      "assets/images/projects/faircado/faircadoMobileImage/fm2.png",
      "assets/images/projects/faircado/faircadoMobileImage/fm3.png",
      "assets/images/projects/faircado/faircadoMobileImage/fm4.png",
      "assets/images/projects/faircado/faircadoMobileImage/fm5.png",
      "assets/images/projects/faircado/faircadoMobileImage/fm6.png",
      "assets/images/projects/faircado/faircadoMobileImage/fm7.png",
      "assets/images/projects/faircado/faircadoMobileImage/fm8.png",
      "assets/images/projects/faircado/faircadoMobileImage/fm9.png",
      "assets/images/projects/faircado/faircadoMobileImage/fm10.png",
      "assets/images/projects/faircado/faircadoMobileImage/fm9.png",
      "assets/images/projects/faircado/faircadoMobileImage/fm11.png",
      "assets/images/projects/faircado/faircadoMobileImage/fm12.png",
    ],
  ),
  ShowcaseProject(
    title: 'Naiara App',
    image: kaNotee,
    shortDescription:
        "Transforming the way you think with Artificial Intelligence",
    description: """
  Naiara.app is a platform that leverages artificial intelligence to transform travel planning. It offers personalized travel experiences by connecting individuals, businesses, and services, aiming to enhance efficiency and satisfaction in every journey.  The platform is available on both Android and iOS devices, providing a user-friendly interface
          
          - Features a travel bot for seamless trip planning.
          - Available on both Android and iOS devices.
          - Includes a personal assistant integrating Google APIs (Calendar, Tasks, Email, etc.).
          - Includes a shopper bot for personalized shopping experiences.
          
        """,
    link: ProjectInfo(
        icon: Icons.link,
        label: "Project Links",
        isLink: true,
        contents: [
          "https://github.com/YeLwinOo-Steve/notee",
        ]),
    heroTag: 'notee',
    tags: ProjectInfo(
      icon: Icons.tag,
      label: 'Tags',
      isTag: true,
      contents: [
        'app',
        _FLUTTER.toLowerCase(),
        _DART.toLowerCase(),
        'note',
        'to-do',
        'timer',
      ],
    ),
    tech: ProjectInfo(
      icon: Icons.laptop_chromebook,
      label: 'Tools & Technologies',
      contents: [
        _FLUTTER.toUpperCase(),
        _DART.toUpperCase(),
        _FIREBASE.toUpperCase(),
      ],
    ),
    author: ProjectInfo(
      icon: Icons.person,
      label: 'Developer',
      contents: [
        _ME,
      ],
    ),
    platform: ProjectInfo(
      icon: Icons.laptop,
      label: 'Available Platforms',
      contents: [
        _ANDROID,
        _IOS,
      ],
    ),
    images: [
      "assets/images/projects/naiara/naiaraImg1.png",
      "assets/images/projects/naiara/naiaraImg8.png",
      "assets/images/projects/naiara/naiaraImg2.png",
      "assets/images/projects/naiara/pa1.png",
      "assets/images/projects/naiara/pa2.png",
      "assets/images/projects/naiara/pa3.png",
      "assets/images/projects/naiara/pa4.png",
      "assets/images/projects/naiara/ta1.png",
      "assets/images/projects/naiara/ta2.png",
      "assets/images/projects/naiara/ta3.png",
      "assets/images/projects/naiara/ta4.png",
      "assets/images/projects/naiara/ps1.png",
      "assets/images/projects/naiara/ps2.png",
      "assets/images/projects/naiara/ps3.png",
      "assets/images/projects/naiara/ps4.png",
    ],
    mobileImages: [
      "assets/images/projects/naiara/nairaMobile/tam1.png",
      "assets/images/projects/naiara/nairaMobile/tam2.png",
      "assets/images/projects/naiara/nairaMobile/tam3.png",
      "assets/images/projects/naiara/nairaMobile/tam4.png",
      "assets/images/projects/naiara/nairaMobile/sm1.png",
      "assets/images/projects/naiara/nairaMobile/sm2.png",
      "assets/images/projects/naiara/nairaMobile/sm3.png",
      "assets/images/projects/naiara/nairaMobile/sm4.png",
      "assets/images/projects/naiara/nairaMobile/psm1.png",
      "assets/images/projects/naiara/nairaMobile/psm2.png",
      "assets/images/projects/naiara/nairaMobile/psm3.png",
      "assets/images/projects/naiara/nairaMobile/psm4.png",
    ],
  ),
  ShowcaseProject(
    title: 'OpenBot',
    image: kaThread,
    shortDescription:
        "OpenBot is an open-source project that transforms a smartphone into an autonomous robot by using its sensors, cameras, and AI capabilities",
    description: """
OpenBot is an open-source project that transforms a smartphone into an autonomous robot by using its sensors, cameras, and AI capabilities
          - It is an affordable, open-source platform designed to make robotics accessible to everyone, requiring only a smartphone and a simple wheeled chassis.
          - OpenBot supports various hardware configurations and can be extended with additional sensors, controllers, or machine learning models for enhanced functionality.
     
        """,
    link: ProjectInfo(
      icon: Icons.link,
      label: "Project Links",
      isLink: true,
      contents: [
        "https://github.com/YeLwinOo-Steve/thread_logo_animation",
      ],
    ),
    heroTag: 'threads_logo',
    tags: ProjectInfo(
      icon: Icons.tag,
      label: 'Tags',
      isTag: true,
      contents: ['animation', _WEB.toLowerCase(), _REACT.toLowerCase()],
    ),
    tech: ProjectInfo(
      icon: Icons.laptop_chromebook,
      label: 'Tools & Technologies',
      contents: [_REACT.toUpperCase(), _FLUTTER.toUpperCase()],
    ),
    author: ProjectInfo(
      icon: Icons.person,
      label: 'Developer',
      contents: [
        _ME,
      ],
    ),
    platform: ProjectInfo(
      icon: Icons.mobile_friendly,
      label: 'Available Platforms',
      contents: [_WEB, _ANDROID, _IOS],
    ),
  ),
];
