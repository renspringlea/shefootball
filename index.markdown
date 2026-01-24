---
layout: home
---

On this webpage, I share some data visualizations on the socio-economic dimensions of women's football (soccer).

# Salary

There is an excellent quote from [Sporting Intelligence](https://globalsportssalaries.com/GSSS%202017.pdf#page=11.48), in the context of Australian rules football (AFL and AFLW): "if the men took a 1 per cent pay cut, it would cover a 100 per cent pay rise for the women."

It would take a little bit more than 1 per cent for women's soccer, but not that much more: 1.4% in England, 4.6% in Germany, and 8.9% in France. The United States is slightly more reasonable at 20%, perhaps because the United States has historically been a strong country for women's sport (and women's soccer) while being a weak country for soccer overall. But even the comparatively reasonable United States represents an 80% pay gap.

I'm reminded of the fact that Fiona Worts, star striker for Adelaide United in Australia's A-League Women, worked at McDonald's in 2022 to supplement her pay ([ABC](https://www.abc.net.au/news/2022-02-15/fiona-worts-feel-good-story-part-time-a-league-women/100830636)). Several A-League Women players left the sport simply because it didn't make economic sense.

Note that this data is from 2017 and might be a little bit out of date — naturally, high-quality data on people's salaries is sensitive and hard to obtain. On the other hand, [a 2024 survey by FIFA](https://inside.fifa.com/womens-football/fifa-benchmarking-report) reported that a mean salary of 24,030 USD for women players in "Tier 1" leagues, which is comparable to the values used in this graph. That same FIFA survey found that salaries for players in lower-tier leagues drop off very quickly to 4,361 USD (Tier 2) and 2,805 (Tier 3) — in US dollars per year!

<a target="_blank" href="analysis_files/results/graph_salary.png"><img alt="Graph of salary of professional football players by gender" src="analysis_files/results/graph_salary.png" /></a>
<div class="tablenotes"><a href="analysis_files/data/salary.csv">Download the data</a><br />
Analysis by SheFootball using data from Sporting Intelligence available <a href="https://globalsportssalaries.com/GSSS%202017.pdf">here</a></div>

# Attendance

There has been a steady increase in the number of fans attending top-flight women's club football matches in England, the United States, and Germany. Australia is lagging, while Japan has a long history of high attendance compared to other countries. All countries took a temporary hit around 2020 due to the pandemic.  

![Graph of attendance at women's football over time](analysis_files/results/graph_attendance.png)

<div class="tablenotes"><a href="analysis_files/data/attendance.csv">Download the data</a><br />
Analysis by SheFootball using data from Wikipedia and <a href="https://footballwebpages.co.uk">footballwebpages.co.uk</a></div>

# ACL injuries

Anterior cruciate ligament (ACL) injuries are a type of serious knee injury that affect women footballers around 2.5 times as frequently as men ([Bloch et al 2025](https://esskajournals.onlinelibrary.wiley.com/doi/abs/10.1002/ksa.70160)). Long recovery times means that players are often out for a year or longer ([Abed et al 2023](https://journals.sagepub.com/doi/pdf/10.1177/23259671231164944)), and Sam Kerr's ACL injury kept her out of the game for 20 months ([Wikipedia](https://en.wikipedia.org/wiki/Sam_Kerr)).

The causes of the higher rate of ACL injuries in women are currently the topic of active debate, and it is likely that our understanding will evolve over the next few years as major sporting bodies conduct studies ([BBC](https://www.bbc.co.uk/sport/football/articles/cxwv38dp748o)). Some key academic sources on this topic are summarized in my blog article [here](https://ryba.ren/2025/01/16/acl-injuries.html).

![Graph of current ACL injuries in various football leagues, by gender](analysis_files/results/graph_acl.png)

<div class="tablenotes"><a href="analysis_files/results/data_alltime.csv">Download the data</a><br />
Analysis by SheFootball using data from <a href="https://soccerdonna.de/">SoccerDonna.de</a> and <a href="Transfermarkt.com">Transfermarkt.com</a></div>

# Barriers

In several countries, there are major legal barriers preventing women from participating in football. Afghanistan has banned women from playing sport since the Taliban takeover in 2021, and football players were targeted for violence — many of Afghanistan's international players were evacuated and settled in Australia ([Wikipedia](https://en.wikipedia.org/wiki/Afghanistan_women%27s_national_football_team#2021_Taliban_takeover_and_disbandment)). Likewise, women's football is banned in Brunei.

Recent news that Qatar was in talks with FIFA to host the first Women's Club World Cup ([The Guardian](https://www.theguardian.com/football/2026/jan/12/qatar-talks-fifa-host-first-womens-club-world-cup-january-2028)) were widely criticized because Qatar is not exactly a paragon of women's football, women's rights, or LGBT+ rights. Qatar's national women's football team has been inactive for over a decade, and being gay is punishable by death ([Independent](https://www.independent.co.uk/news/world/gay-lesbian-bisexual-relationships-illegal-in-74-countries-a7033666.html)).

It is also worth noting that many European countries banned women from playing football during the 20th century. Notably, the FA's 1921 ban on women playing football in England was only lifted in 1971 ([Wikipedia](https://en.wikipedia.org/wiki/Bans_of_women%27s_association_football)), and even today the FA bans trans women from playing. This mean that I can play football in neither England nor Afghanistan — strange bedfellows indeed.

![Map showing countries where women either are banned from playing football or have no active national team](analysis_files/results/countries_map.png)

<div class="tablenotes"><a href="analysis_files/data/countries.csv">Download the data</a><br />
Analysis by SheFootball using data from Wikipedia, FIFA, and MSN</div>

# Football — the amateur sport

Most of the news coverage and published statistics — including this website — focuses on professional football. But in terms of participation numbers, football is overwhelmingly dominated by amateur football.

- England — **99.989% amateurs**
- United States — **99.997% amateurs**
- Australia — **99.984% amateurs**

This means that professional players make up between 0.003 and 0.01 percent of players, depending on country. This is similar to your chance of dying of a bee sting (0.002%), being struck by lightning during your lifetime (0.007%), or getting a perfect score on the SAT (0.03%). Can you imagine if only people who have been struck by lightning could vote, or if the health department focused almost entirely on bee stings?

The following image illustrates this for Australia. Every grey pixel in the image represents an amateur player of women's football in Australia. The tiny blue line at the bottom represents the vanishingly small number of professionals.

![Image comparing amateur vs professional numbers in Australia](analysis_files/results/g_amateur.png)

Australia also publishes data on the age of amateur players. The most common age group is age 25 to 34 with over a quarter of players, which surprised me. There are almost as many players aged 45 and over (12.5 %) as there are players aged 15 to 17 (14.6 %).

![Age structure of amateur players in Australia](analysis_files/results/graph_age.png)

Policies aiming to exclude transgender players in England and the United States is usually grounded in discussions of the professional game rather than the amateur game. The diversity in age groups also raises the question of whether the "unfair advantage" discourse has any merit in a sport where teenagers play alongside players aged 50+ (my own team has both!).

<div class="tablenotes">Calculations: England has approximately 3 million amateurs in women's football (<a href="https://www.thefa.com/womens-girls-football/get-involved/play-football">FA</a>), compared to 345 players in the Women's Super League (<a href="https://www.soccerdonna.de/en/womens-super-league/startseite/wettbewerb_ENG1.html">SoccerDonna</a>). The United States has approximately 14.1 million amateurs in women's football (<a href="https://www.forsoccer.com/insight/soccer-participation-in-the-united-states/">For Soccer</a>), compared to a maximum of 416 players in the National Women's Soccer League. Australia has 1,233,355 amateurs in women's football (<a href="https://app.powerbi.com/view?r=eyJrIjoiMzg2NTFmZGEtNGRhZC00Yzg2LWFjMjktNTViZTc2NDYwN2RiIiwidCI6IjhkMmUwZjRjLTU1ZjItNGNiMS04ZWU3LWRhNWRkM2ZmMzYwMCJ9">ASC</a>), compared to a maximum of 192 players in the A-League Women.</div>

# Blog

If you enjoyed these data visualizations, you might enjoy these blog articles:  

- [The economics of taking the ball to the corner flag](https://ryba.ren/2025/05/24/corner-flag.html) — equations on time wasting
- [What are we doing when we play (and watch) sport?](https://ryba.ren/2025/05/03/soccer-arbitrary-meaning.html) — the philosophy of football
- [Soccer, the offside rule, and generational amnesia](https://ryba.ren/2025/04/05/offside-amnesia.html) — why moving the offside line forward won't solve any problems
- [Athletes and mental health challenges](https://ryba.ren/2025/04/04/athletes-mental.html)
- [Unique soccer matches from history](https://ryba.ren/2025/03/29/unique-soccer.html)
