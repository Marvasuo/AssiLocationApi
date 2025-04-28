# Tilarajapinnan tunnisteet

Tilarajapinnassa käytetään seuraavia tunnistetietoa yksilöimään tiloja:
1. Arkkitehtuurinumero
2. G Space ID
3. GLN

Tunnisteista arkkitehtuurinumero on Modulon yksilöivä tunniste. Tästä huolimatta tunnistetta ei luokitella ensisijaiseksi vaan käytetään FHIR koodiston `usual` koodia. Tämä ei kuitenkaan tarkoita sitä, että kaikkien järjestelmien tulisi näyttää tämä tunniste käyttäjille, kuten FHIR koodisto ehdottaa! Arkkitehtuurinumeron luokittelu johtuu pääasiallisen lähdejärjestelmän, Modulon, tietorakenteesta. Arkkitehtuurinumero tulee alkuperäisistä arkkitehtuuripiirrustuksista, jossa jokaiselle tilalle on annettu yksilöivä tunniste. Tämä tieto on saatavilla Modulosta `tilatunnus` tietokentästä. Lisäksi arkkitehtuurinumeroa käytetään joissain järjestelmissä osana käyttäjälle näytettävää nimeä, joten sitä voidaan käyttää koodiston ehdottomalla tavalla. Tämä ei kuitenkaan ole suositeltu toimintatapa. Tämän tunnisteen näyttämisellä täytyy lähtökohtaisesti olla hyvä syy, jotta se ei aiheuta hämmennystä käyttäjälle.

>`G Space ID` on monissa järjestelmissä tiloja yksilöivä tunniste mutta tämä ei välttämättä ole aina yksilöllinen tunniste. Lähinnä ongelma koskee olemassa olevia 
> kiinteistöjä ja erityisesti sellaisia tiloja, joista on useampi rivi tietokannassa ja jotka ovat yhteiskäyttöisiä. Modulossa voi olla useampi rivi tilasta 
> kustannuspaikkasyistä. Assi sairaalassa ei pitäisi olla samaa ongelmaa mutta varmuutta asiasta ei ole saatu. Näin ollen G Space ID luokitellaan `secondary` koodilla.

GLN (Global Location Number) on sijainti- ja osapuolitunniste, jota käytetään käytännössä monin eri tavoin toimitusketjujen hallinnassa ja liiketoimintaprosessien optimoinnissa.Alla esimerkkejä, jotka liittyvät erityisesti tilojen ja laitteiden seurantaan.

1. Toimipaikkojen tunnistaminen: GLN-numeroita käytetään yksilöimään organisaation eri toimipaikat, kuten varastot, yksiköt ja toimistot. 
2. Automatisointi ja jäljitettävyys: GLN-numeroita voidaan koodata viivakoodeihin tai RFID-tunnisteisiin, mikä mahdollistaa automaattisen tunnistamisen ja seurannan. 

GLN-tunniste otetaan käyttöön laite- ja välinehallinnan ja logistiikan tietojärjestelmissä. GLN on loogisin täydellisen yksilöllinen tunniste, mutta GLN-numeroita ei hallinnoida Modulossa eikä niitä ole sinne mahdollista lisätä. Tästä huolimatta GLN-numero määritellään ensisijaiseksi `official` tunnisteeksi koska tulevaisuudessa kaikki Kanta-Hämeen hyvinvointialueen tilat on mahdollista yksilöidä yhtenevällä numerokoodilla.

> GLN-numeron ylläpidolle ei ole tiedossa lähdejärjestelmää, joten tunnisteen mäppääminen Modulossa oleviin tiloihin on tehtävä erikseen integraatiokerroksessa. 
> Käytännössä integraatiokerroksessa Modulosta saatua tietoa rikastetaan GLN-numeroilla.

# Tilojen nimet

Tilojen nimeämiseen liittyy paljon yksikkö- ja toimintokohtaisia käytäntöjä ja mieltymyksiä. Esimerkiksi osaston toiminnan näkökulmasta voi olla mielekästä nimetä potilashuoneet tavalla, jota ei voi päätellä tunnisteista tai muista teknisistä muuttujista. Toisaalta kiinteistöhuollon näkökulmasta samojen tilojen nimet voivat olla erilaisia ja nimi saattaa olla johdettavissa teknisistä tunnisteista ja muuttujista. Toisin sanoen käyttäjälle näytettävä nimi voi olla hyvin erilainen käyttöympäristöstä riippuen.

Tilarajapinnan tietosisällössä nimi on *ihmisten päättämä ja ei ole pääteltävissä muista rajapinnan tiedoista*. Lisäksi olisi suotavaa, että nimi *ei kuvasta pelkästään tilan geneeristä käyttötarkoitusta*. Jälkimmäinen suositus viittaa tilanteisiin, jossa varastoja nimettäisiin yleisesti välinevarastoiksi tia liinavaatevarastoiksi. Tällainen nimeäminen voi olla perusteltua, jos sille on selkeä tarve eikä tarvetta voida täyttää geneerisellä 'varasto' nimellä ja kuvaamalla käyttöä jollain muulla tavalla kuten kategoriomalla tms.

Nimitiedon lähdejärjestelmänä toimii Modulo.

> HUOM! Tilatietoa käyttävillä järjestelmillä saattaa olla teknisiä rajoitteita nimen osalta. Nimellä saattaa olla tietty sallittu merkkimäärä tai rajoitteita skandimerkkien osalta.
> Näitä erityispiirteitä on hyvä tarkastella jo tilojen nimeämisvaiheessa mutta tilaintegraatioratkaisu ei tee transformaatiota nimille yksittäisten järjestelmien kohdalla.
> Tietojärjestelmät, jotka eivät pysty hyödyntämään tilarajapinnan nimitietoa sellaisenaan, on itse tehtävä tarvittavat muutokset.

# Tilan tyyppi

Modulo-järjestelmässä tiloja luokitellaan eri tyyppien mukaan `tilaluokka` tietokentän avulla. Kyseisen tietokentän tiedot ovat kansallisesti yhtenäistettyjä. Tilaluokkien nimeämiset eivät välttämättä ole suoraan sellaisia, jotka soveltuvat sellaisenaan vaan niitä on muokattava paremmin soveltuviksi Assi sairaalan käyttöön. Mäppäystaulukko tilaluokkien muuttamiselle rakennetaan integraatiokerrokseen.

Alla kattava lista mäpättävistä arvoista:

| Lähdejärjestelmän (Modulo) arvo                      | Koodi | Perusmuoto (standardoidusti käytettävä arvo)       |
|------------------------------------------------------|-------|----------------------------------------------------|
| Toimistotilat                                        | toi   | Toimistotila                                      |
| Toimistotilat, erikoisvar.                           | toe   | Toimistotila, erikoisvarustus                     |
| Kokoustilat                                          | kok   | Kokoustila                                        |
| Monitoimityötilat                                    | mot   | Monitoimityötila                                  |
| Liiketilat                                           | lii   | Liiketila                                         |
| Opetustilat ja luentosalit                           | opt   | Opetustila tai luentosali                         |
| Muut opetus- ja terapiatilat                         | mtp   | Muu opetus- tai terapiatila                       |
| Laboratoriot                                         | lab   | Laboratorio                                       |
| Puhdastilat                                          | puh   | Puhdastila                                        |
| Olosuhdehuoneet                                      | olo   | Olosuhdehuone                                     |
| Ryhmätilat                                           | rhy   | Ryhmätila                                         |
| Leikkaussalit                                        | lei   | Leikkaussali                                      |
| Synnytyssalit                                        | syn   | Synnytyssali                                      |
| Potilashuoneet                                       | pot   | Potilashuone                                      |
| Eristyshuoneet                                       | eri   | Eristyshuone                                      |
| Tehohoito                                            | teh   | Tehohoitotila                                     |
| Kappelit, jäähyväishuoneet                           | kap   | Kappeli tai jäähyväishuone                        |
| Toimenpidehuoneet                                    | tph   | Toimenpidehuone                                   |
| Vastaanottohuoneet                                   | vas   | Vastaanottohuone                                  |
| Vastaanottohuoneet, kevyt                            | vak   | Vastaanottohuone, kevyt                           |
| Vastaanottohuoneet, erikoisvar.                      | vae   | Vastaanottohuone, erikoisvarustus                 |
| Kuvantamishuoneet                                    | kuv   | Kuvantamishuone                                   |
| Kuvantamishuoneet, erikoisvar.                       | kve   | Kuvantamishuone, erikoisvarustus                  |
| Valvonta- ja tarkkailutilat                          | val   | Valvonta- tai tarkkailutila                       |
| Heräämö                                              | her   | Heräämö                                           |
| Vainajien säilytystilat                              | vai   | Vainajien säilytystila                            |
| Obduktio- ja dissektiotilat                          | obd   | Obduktio- tai dissektiotila                       |
| Välinehuoltotilat                                    | whs   | Välinehuoltotila                                  |
| Kirjastot                                            | lib   | Kirjasto                                          |
| Liikuntasalit                                        | gym   | Liikuntasali                                      |
| Kuntosalit                                           | fit   | Kuntosali                                         |
| Pelastustoimen laitehuoltotilat                      | res   | Pelastustoimen laitehuoltotila                   |
| Varastotilat                                         | sto   | Varastotila                                       |
| Varastotilat, kylmä                                  | stc   | Varastotila, kylmä                                |
| Varastotilat, erikois                                | ste   | Varastotila, erikoisvarustus                      |
| Arkistotilat                                         | arc   | Arkistotila                                       |
| Auto- ja kalustohalli, lämmin                        | gar   | Auto- tai kalustohalli, lämmin                    |
| Pesuhalli                                            | was   | Pesuhalli                                         |
| Ruokasalit                                           | din   | Ruokasali                                         |
| Keittiöt                                             | kit   | Keittiö                                           |
| Jakelu- ja palvelukeittiöt                           | ser   | Jakelukeittiö tai palvelukeittiö                 |
| Kylmiöt                                              | ref   | Kylmiö                                            |
| Pakastehuoneet                                       | fre   | Pakastehuone                                      |
| Pukutilat                                            | cha   | Pukutila                                          |
| Pesutilat                                            | bat   | Pesutila                                          |
| WC-tilat                                             | wc    | WC-tila                                           |
| Saunat                                               | sau   | Sauna                                             |
| Taukotilat                                           | brk   | Taukotila                                         |
| Oleskelutilat                                        | lou   | Oleskelutila                                      |
| Valmiushuoneet                                       | rea   | Valmiushuone                                     |
| Väestönsuojatilat                                    | she   | Väestönsuojatila                                  |
| Sisäänkäyntitilat                                    | ent   | Sisäänkäyntitila                                  |
| Aulat ja odotustilat                                 | lob   | Aula tai odotustila                              |
| Siivous- ja huoltotilat                              | cln   | Siivous- tai huoltotila                          |
| Vaate- ja tekstiilihuoltotilat                       | tex   | Vaate- tai tekstiilihuoltotila                   |
| Teknisen huollon tilat                               | mnt   | Teknisen huollon tila                            |
| Jätehuoltotilat                                      | wasd  | Jätehuoltotila                                   |
| Käytävät (jakava liikenne)                           | cor   | Käytävä (jakava liikenne)                        |
| Sulkutilat                                           | isl   | Sulkutila                                        |
| Logistiikka- ja terminaalitilat                      | log   | Logistiikka- tai terminaalitila                 |
| Porrashuoneet (osastoiva liikenne)                   | sta   | Porrashuone (osastoiva liikenne)                 |
| Tekniset tilat                                       | tfn   | Tekninen tila                                    |
| Tekniset tilat, erikoisvar.                          | tfne  | Tekninen tila, erikoisvarustus                   |
| Tekniset aputilat                                    | sup   | Tekninen aputila                                 |
| Raakatilat                                           | raw   | Raakatila                                         |
| Hissit                                               | ele   | Hissi                                             |


# Kustannuspaikka- ja organisaatiotiedon suhde toisiinsa

Assi Sairaalan tilatietojen käytössä on erikoisuus, joka pakottaa käsittelemään tilan kustannuspaikkatietoa ja ylläpitävän organisaation tietoa erillään toisistaan. Erityisesti hoitologistiikoilla on tarve kohdistaa tehtyä työaikaa yksiköittäin tai osastoittain. Tässä yhteydessä yksikkö ja osasto on organisaation osa. Logistiikot kirjaavat tehdyn työajan tietylle yksikölle ja työaika laskutetaan yksiköltä erikseen. Suurimmassa osassa tapauksia tämä ei tuota ongelmia mutta Assi Sairaalassa on olemassa myös ns. yhteiskäyttöisiä tiloja. Tällöin tilaa käyttää useampi yksikkö. FHIR standardissa tilan omistajuutta kuvataan `managingOrganisation` kentällä mutta standardin mukaan kyseisen tieto voi ilmetä vain kerran resurssilla. Näin ollen kustannuspaikkatietoa varten on laadittu laajennos [ResponsibleUnit](./StructureDefinition-responsible-unit.html), joka mahdollistaa useamman yksikön liittämisen tilatietoon.

Tilalla voi olla kuitenkin `managingOrganisation` tieto. Tässä soveltamisoppaassa tällä kuitenkin viitataan ylätason organisaatioon, joka voi tässä tapauksessa olla "Kanta-Hämeen hyvinvointialue".

# Määriteltäviä asioita

- Tilatietorajapinnan operaatiot ja/tai transaktiot
- Miten Modulon organisaatiotason tiedot on saatavilla rajapinnan kautta. Contained resource vai normaaliin tapaan omana identiteettinä?
- Koodisto tilan tyypille.
- TRH:n pitäisi pystyä päivittämään tilan ominaisuuksia ja resurssitietoja. Eli mitä erityispiirteitä tilalla on ja minkälaiseen palveluntarpeeseen tila sopii. Miten tämä ratkaistaan? HealthcareService ja Device resurssit? Joku kevyempi ratkaisu?
- Tilatiedot hyödyntäminen karttaratkaisuissa. Position-tiedon täydentäminen.