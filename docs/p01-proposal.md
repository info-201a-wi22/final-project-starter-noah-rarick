# Title of your Project: Project Proposal 

**TODO**: Edit this file. Your project proposal goes here. Save and delete the developer notes when done.

## Developer Notes

* **Where is the project brief?**  [`../instructions/project-design-brief.pdf`](../instructions/project-design-brief.pdf).
* **Making Progress**: We understand this work might be difficult. Also, we understand that your project ideas might not be completely worked out. So, we ask that you do the best you can. You will receive specific guidance from your TA and constructive feedback. We are confident that you will succeed! 
* **What should be included in the proposal?** Every proposal will be different. It depends on your particular project.  That said, in the table below you will find the expected report elements.  It is important that you engage with and respond to the the Design Brief. 
* **How should the proposal be formatted?** You should format your proposal using Markdown in this file. You should aim for a professional presentation - clear, concise, interesting, and free of spelling and grammatical errors. 
* **What headings should we use?** As needed, the suggested headings below can be revised and new headings and sub-headings can be added. Please use headings, bullet lists, tables, figures, and other markdown code effectively - seek a professional presentation. 
* **Finishing up.** When you are finished writing and formatting your proposal, save these developer notes(they might useful in the future). Then, delete them.
* **Questions?** If you have questions, please ask your TA or post on Teams.

|Element | Brief Description|
|---------------| --------------
|Code name | Give your project a _code name_, a short, evocative name for efficiently referring to your project. Your code name does not change! Examples: _Jazz-4_, _Rocking Fish_, etc. | 

### *Code Name*
**_Sleep_Project_**

### *Title*
Analyzing the relationship between reported sleep quality and levels of depression, anxiety and daily activites.

### *Authors*
1. Noah Rarick noah.rarick@gmail.com
2. Vincent Chen vchen5@uw.edu
3. Qiyuan Pan 2733893550@qq.com
4. Wenyu Jiao wenyuj2@uw.edu

#### *Affiliation*
  INFO-201: Technical Foundations of Informatics - The Information School - University of Washington |
#### **Date**
**February 2nd 2022** 
|Abstract | No more than three sentences that summarize your project. Focus on the very most important aspects. For example: **(1)** "Our main question is .... This question is important because .... To address the question, we will ...." **(2)** "We are concerned with ..., becuase .... To address this concern, we plan to ...." **(3)** "Consider that ....  This is important because .... Accordingly, we plan to ...."   |
### **Abstract**
How does an individuals sleep quality effect their mental wellbeing in regards to anxiety and depression levels? To address the question, we will compare the reported levels of anxiety and depression to each individuals reported sleep quality to see if there is a correlation between these factors. This is important because sleep is often overlooked by students as a possible factor in the depression and anxiety that students are facing at increasing levels.

.
### **Keywords** (e.g., "Keywords: human physiology; bicycle exercise; elderly; power and heart rate times-series data") |
- *Human physiology*
- *Sleep quality*
- *Depression and anxiety*

### **Introduction**

_Sleep_Project_ is aiming to calculate trends between sleep quality and depression/anxiety. Sleep is incredibly important for an individuals wellbeing, however is often overlooked as a driving factor in depression, anxiety and panic levels. This project will focus on data reported on individuals regarding depression, anxiety, panic, BMI and age and see how these factors are related to sleep quality. By analyzing these trends hopefully it will become apparent what correlating factors either promote or reduce sleep quality. 

### **Design Situation**
_Sleep_Project_ is hoping to provide insight to students on how sleep can positively or negatively affect mental well being. In general, our goal is to provide statistical evidence that can influence student behavior to improve overall student body health. 

#### **Effects of Student Sleep Deprivation:**
    Student performance and sleep quality are strongly linked according to research produced in “Cyberpsychology, Behavior, and Social Networking” by Lynette  Vernon. Researchers concluded that problematic social media use before bed was linked to increased sleep disturbances. These adolescents that had lower sleep quality also reported lower satisfaction with their schoolwork. The relationship between sleep and school satisfaction encouraged our research into how sleep deprivation may be linked to other negative health conditions. 

#### Sleep Apnea 
    Research from the Journal of Clinical and Expiremental Neurophyschology substantiates the claim that sleep is essential for mental health. The study conducted experiments on those with obstructive sleep apnea. Researchers concluded that
    > “Poorer sleep quality was related to slower processing speed, somatic symptomatology and tension-anxiety levels. “
    So not only is sleep important for work satisfaction, but is also a major factor in overall mental performance. For students aiming to optimize their performance, this is essential information that isn’t necessarily accessible or well known. _Sleep_Project_ is hoping to make this information more accessible for students such as ourselves. 

#### Social Media, Sleep Quality and Anxiety/Depression
    Similarly, research in “#Sleepyteens” found links between social media use and decrease in sleep quality, resulting in higher HADS scores for anxiety and depression. Researchers found after surveying ~500 Scottish students that personal investment in social media was the strongest predictor of self-esteem issues, depression and anxiety. The publication notes that social media use is strongly correlated with later bedtimes and less restful sleep, increasing sleep deprivation which increases risk of depression/anxiety. 

### **Research Questions**
- How does sleep quality change through the different age ranges? 
    -Finding average sleep quality of the different age ranges and comparing the mean sleep quality.
- What relationship does sleep quality have with anxiety? 
    -What are the levels of anxiety when sleep quality is low? Is the mean sleep quality different among participants with low, medium and high sleep quality?
- How do reported levels of depression change as sleep quality decreases? 
    -Comparing the HADS depression scores across participants in relation to low, medium, and high sleep quality. 

### *The Dataset*
[Sleep Quality Data](https://www.kaggle.com/feraco/sleep-deprivation?select=demdata_160225_pseudonymized.csv)
#### Origin and Size
    Our data set is from Kaggle, produced from a Swedish study that unfortunately we cannot find the origin/publishers of. The data set has 106 columns for 91 participants and the elements that are researched range from HADS anxiety scores to sleep quality metrics to BMI and even participant info such as education level. 

#### Research Methods
    For all mental health statistics the HADS questionairre was used. This is an extremely common questionaire to assess the mental status of subjects. All the sleep data was obtained through the "Karolinska Sleep Questionnaire" which asks participants to self report things such as wakeup times, sleep times, nap times, sleep quality, and even levels of panic/worry. Participant background information such as conctraceptive status, BMI, height and age are all included. 
    All participants were asked to complete the Brown ADD questionnaire, 5 Personality Trait questionnaire and more to provide background on each participant and note any confounding factors that may effect sleep quality.

 #### Notes on Collected Data
    The data set includes an incredible amount of information on each participant, providing a whole background on what lifestyle they may be living and what factors may effect their sleep. With so many data points, it may be difficult to find trends directly relating sleep to anxiety/depression as there are hundreds of confounding factors that the researchers collected. 
    #### Participant Pool
    The participant pool are residents of Sweden with varying ages, sexes, backgrounds and education status. From the data it is clear that there is a very wide assortment of participants. 


### *Implications*
Upon adequately conveying the correlation between an individual’s sleep quality and influence on various aspects in regards to health and mental well-being, some expected implications that may arise for technologists and designers derive from the fact that information technology such as social media, phones and other various forms of digital mediums are driving factors in promoting poor sleep quality amongst  younger populations, as noted in the article “#Sleepyteens: Social media use in adolescence is associated with poor sleep quality, anxiety, depression, and low self-esteem,” in which Woods and Scott allude to how variables such as “Nighttime-specific social media use,” “Emotional investment in social media” displayed a notable significance in influencing an individual’s self-esteem, anxiety, and depression, as denoted by data collected in their study. The means and standard deviations draws attention to how “poorer sleep quality” was associated with “nighttime-specific social media use,” with a correlation coefficient  r = .34, p  <.001, providing a strong association between poor sleep quality and nighttime-specific social media use. While also linking an association between poor sleep quality on mental well-being, with   (Woods & Scott, 2016, p. ). This sentiment may implicate technologists and designers as it may prompt necessary reforms in the ways in which social media usage is deployed to consumers and require systematic changes to apps limiting over-consumption possibilities. 

### *Limitations*
Upon adequately conveying the correlation between an individual’s sleep quality and influence on various aspects in regards to health and mental well-being, some expected implications that may arise for technologists and designers derive from the fact that information technology such as social media, phones and other various forms of digital mediums are driving factors in promoting poor sleep quality amongst  younger populations, as noted in the article “#Sleepyteens: Social media use in adolescence is associated with poor sleep quality, anxiety, depression, and low self-esteem,” in which Woods and Scott allude to how variables such as “Nighttime-specific social media use,” “Emotional investment in social media” displayed a notable significance in influencing an individual’s self-esteem, anxiety, and depression, as denoted by data collected in their study. The means and standard deviations draws attention to how “poorer sleep quality” was associated with “nighttime-specific social media use,” with a correlation coefficient  r = .34, p  <.001, providing a strong association between poor sleep quality and nighttime-specific social media use. While also linking an association between poor sleep quality on lower self-esteem, increased anxiety and depression levels, with the respective correlation coefficients, r = -.41, p < .001, r= .53, p <.001, r = .42, p <.001. (Woods & Scott, 2016, p. ). This sentiment may implicate technologists and designers as it may prompt necessary reforms in the ways in which social media usage is deployed to consumers and require systematic changes to apps limiting over-consumption possibilities. With policymakers, they may be urged to raise more awareness and provide more resources encompassing the importance of sleep quality and its detrimental effects on overall mental well-being, and means of mitigating its prevalence among the population. 

### *Acknowledgements*
Thank you to Christy Brown, who helped Vincent look for research materials on sleep deprivation and its effects on mental wellbeing.

### *References*
Additional informationFundingData for this study were extracted from a research project at the Saveh University of Medical Sciences which was supported by Social Determinants of Health Research Center. The funders had no role in study design. “The Association between Internet Addiction, Sleep Quality, and Health-Related Quality of Life among Iranian Medical Students.” Taylor &amp; Francis, https://www.tandfonline.com/doi/full/10.1080/10550887.2020.1762826. 

CyberSightings | Cyberpsychology, Behavior, and Social ... https://www.liebertpub.com/doi/abs/10.1089/cyber.2015.29015.csi. 

“Neurobehavioral Functioning in Obstructive Sleep Apnea: Differential Effects of Sleep Quality, Hypoxemia and Subjective Sleepiness.” Taylor &amp; Francis, https://www.tandfonline.com/doi/abs/10.1076/jcen.26.1.43.23929. 

Woods, Heather Cleland, and Holly Scott. “#Sleepyteens: Social Media Use in Adolescence Is Associated with Poor Sleep Quality, Anxiety, Depression and Low Self-Esteem.” Journal of Adolescence, Academic Press, 10 June 2016, https://www.sciencedirect.com/science/article/pii/S0140197116300343#bib17. 

“Explore Scientific, Technical, and Medical Research on ScienceDirect.” ScienceDirect.com | Science, Health and Medical Journals, Full Text Articles and Books., https://www.sciencedirect.com/.  

|Appendix A: Questions| Do you have questions for your TA or instructor?  Include them here.|
