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
| Toimistotilat                                        | 211   | Toimistotila                                      |
| Toimistotilat, erikoisvar.                           | 2112  | Toimistotila, erikoisvarustus                     |
| Kokoustilat                                          | 214   | Kokoustila                                        |
| Monitoimityötilat                                    | 215   | Monitoimityötila                                  |
| Liiketilat                                           | 22    | Liiketila                                         |
| Opetustilat ja luentosalit                           | 31    | Opetustila tai luentosali                         |
| Muut opetus- ja terapiatilat                         | 3249  | Muu opetus- tai terapiatila                       |
| Laboratoriot                                         | 362   | Laboratorio                                       |
| Puhdastilat                                          | 3651  | Puhdastila                                        |
| Olosuhdehuoneet                                      | 366   | Olosuhdehuone                                     |
| Ryhmätilat                                           | 371   | Ryhmätila                                         |
| Leikkaussalit                                        | 441   | Leikkaussali                                      |
| Synnytyssalit                                        | 4411  | Synnytyssali                                      |
| Potilashuoneet                                       | 442   | Potilashuone                                      |
| Eristyshuoneet                                       | 4421  | Eristyshuone                                      |
| Tehohoito                                            | 4422  | Tehohoitotila                                     |
| Kappelit, jäähyväishuoneet                           | 443   | Kappeli tai jäähyväishuone                        |
| Toimenpidehuoneet                                    | 444   | Toimenpidehuone                                   |
| Vastaanottohuoneet                                   | 4441  | Vastaanottohuone                                  |
| Vastaanottohuoneet, kevyt                            | 44411 | Vastaanottohuone, kevyt                           |
| Vastaanottohuoneet, erikoisvar.                      | 44412 | Vastaanottohuone, erikoisvarustus                 |
| Kuvantamishuoneet                                    | 4443  | Kuvantamishuone                                   |
| Kuvantamishuoneet, erikoisvar.                       | 4445  | Kuvantamishuone, erikoisvarustus                  |
| Valvonta- ja tarkkailutilat                          | 4451  | Valvonta- tai tarkkailutila                       |
| Heräämö                                              | 4454  | Heräämö                                           |
| Vainajien säilytystilat                              | 446   | Vainajien säilytystila                            |
| Obduktio- ja dissektiotilat                          | 447   | Obduktio- tai dissektiotila                       |
| Välinehuoltotilat                                    | 448   | Välinehuoltotila                                  |
| Kirjastot                                            | 4615  | Kirjasto                                          |
| Liikuntasalit                                        | 471   | Liikuntasali                                      |
| Kuntosalit                                           | 472   | Kuntosali                                         |
| Pelastustoimen laitehuoltotilat                      | 4911  | Pelastustoimen laitehuoltotila                   |
| Varastotilat                                         | 521   | Varastotila                                       |
| Varastotilat, kylmä                                  | 5292  | Varastotila, kylmä                                |
| Varastotilat, erikois                                | 5293  | Varastotila, erikoisvarustus                      |
| Arkistotilat                                         | 531   | Arkistotila                                       |
| Auto- ja kalustohalli, lämmin                        | 552   | Auto- tai kalustohalli, lämmin                    |
| Pesuhalli                                            | 555   | Pesuhalli                                         |
| Ruokasalit                                           | 63    | Ruokasali                                         |
| Keittiöt                                             | 642   | Keittiö                                           |
| Jakelu- ja palvelukeittiöt                           | 645   | Jakelukeittiö tai palvelukeittiö                 |
| Kylmiöt                                              | 651   | Kylmiö                                            |
| Pakastehuoneet                                       | 652   | Pakastehuone                                      |
| Pukutilat                                            | 71    | Pukutila                                          |
| Pesutilat                                            | 72    | Pesutila                                          |
| WC-tilat                                             | 73    | WC-tila                                           |
| Saunat                                               | 74    | Sauna                                             |
| Taukotilat                                           | 751   | Taukotila                                         |
| Oleskelutilat                                        | 752   | Oleskelutila                                      |
| Valmiushuoneet                                       | 753   | Valmiushuone                                      |
| Väestönsuojatilat                                    | 81    | Väestönsuojatila                                  |
| Sisäänkäyntitilat                                    | 83    | Sisäänkäyntitila                                  |
| Aulat ja odotustilat                                 | 832   | Aula tai odotustila                               |
| Siivous- ja huoltotilat                              | 86    | Siivous- tai huoltotila                           |
| Vaate- ja tekstiilihuoltotilat                       | 865   | Vaate- tai tekstiilihuoltotila                   |
| Teknisen huollon tilat                               | 866   | Teknisen huollon tila                             |
| Jätehuoltotilat                                      | 87    | Jätehuoltotila                                    |
| Käytävät (jakava liikenne)                           | 91    | Käytävä (jakava liikenne)                         |
| Sulkutilat                                           | 911   | Sulkutila                                         |
| Logistiikka- ja terminaalitilat                      | 912   | Logistiikka- tai terminaalitila                   |
| Porrashuoneet (osastoiva liikenne)                   | 921   | Porrashuone (osastoiva liikenne)                  |
| Tekniset tilat                                       | 94    | Tekninen tila                                     |
| Tekniset tilat, erikoisvar.                          | 941   | Tekninen tila, erikoisvarustus                   |
| Tekniset aputilat                                    | 942   | Tekninen aputila                                  |
| Raakatilat                                           | 991   | Raakatila                                         |
| Hissit                                               | 9911  | Hissi                                             |


# Kustannuspaikka- ja organisaatiotiedon suhde toisiinsa

Assi Sairaalan tilatietojen käytössä on erikoisuus, joka pakottaa käsittelemään tilan kustannuspaikkatietoa ja ylläpitävän organisaation tietoa erillään toisistaan. Erityisesti hoitologistiikoilla on tarve kohdistaa tehtyä työaikaa yksiköittäin tai osastoittain. Tässä yhteydessä yksikkö ja osasto on organisaation osa. Logistiikot kirjaavat tehdyn työajan tietylle yksikölle ja työaika laskutetaan yksiköltä erikseen. Suurimmassa osassa tapauksia tämä ei tuota ongelmia mutta Assi Sairaalassa on olemassa myös ns. yhteiskäyttöisiä tiloja. Tällöin tilaa käyttää useampi yksikkö. FHIR standardissa tilan omistajuutta kuvataan `managingOrganisation` kentällä mutta standardin mukaan kyseisen tieto voi ilmetä vain kerran resurssilla. Näin ollen kustannuspaikkatietoa varten on laadittu laajennos [ResponsibleUnit](./StructureDefinition-responsible-unit.html), joka mahdollistaa useamman yksikön liittämisen tilatietoon.

Tilalla voi olla kuitenkin `managingOrganisation` tieto. Tässä soveltamisoppaassa tällä kuitenkin viitataan ylätason organisaatioon, joka voi tässä tapauksessa olla "Kanta-Hämeen hyvinvointialue".

# Määriteltäviä asioita

- Tilatietorajapinnan operaatiot ja/tai transaktiot
- Miten Modulon organisaatiotason tiedot on saatavilla rajapinnan kautta. Contained resource vai normaaliin tapaan omana identiteettinä?
- Koodisto tilan tyypille.
- TRH:n pitäisi pystyä päivittämään tilan ominaisuuksia ja resurssitietoja. Eli mitä erityispiirteitä tilalla on ja minkälaiseen palveluntarpeeseen tila sopii. Miten tämä ratkaistaan? HealthcareService ja Device resurssit? Joku kevyempi ratkaisu?
- Tilatiedot hyödyntäminen karttaratkaisuissa. Position-tiedon täydentäminen.
- Tilan tyypin koodit vaihdettava numeroiksi (suorituspaikkakoodi)