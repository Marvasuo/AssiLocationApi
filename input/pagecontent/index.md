
# Johdanto

Kanta-Hämeen hyvinvointialueelle nousee uusi Ahveniston sairaala nimeltään Assi. Sairaala on tulevaisuuden terveydenhuollon ja uuden sukupolven sairaala sekä palvelukeskus, jota rakennetaan Ahveniston luonnonpuiston kupeeseen Hämeenlinnaan. Tavoitteena on luoda Kanta-Hämeeseen korkeatasoinen terveydenhuollon keskittymä, joka vastaa tulevaisuuden terveydenhuollon tarpeisiin asiakaslähtöisesti. Tavoitteen saavuttamiseksi Assiin on suunniteltu otettavan käyttöön paljon uusia sairaalan palvelutuotannon ohjausjärjestelmiä, jotka muun muassa tehostavat potilasohjausta, tilojen käyttöä, henkilöstön työvuorosuunnittelua ja erilaisten tukipalveluiden hyödyntämistä päivittäisen työn tukena. Jälkimmäiseen esimerkkinä ovat muun muassa palvelupyynnöt potilassiirtoja, korjauspyyntöjä tai varastontäydennyksiä varten.

Sairaalan palvelutuotannon ohjaus on mittava ja monimutkainen kokonaisuus, jonka mahdollistamiseksi eri käyttötarkoituksiin tarkoitetuilla järjestemillä on oltava yhteinen tapa hyödyntää ohjaukseen liittyviä tietoja ja mahdollisuus jakaa ajantasaista tietoa palvelutuotannon kokonaisuuksiin liittyen. Sairaalan tilat ovat yksi tietojoukko, jota useat tietojärjestelmät tarvitsevat toimiakseen oikein. Nämä järjestelmät ovat palvelupolusta riippuen enemmän tai vähemmän riippuvaisia toisistaan jakaen tietoa keskenään. Järjestelmien saumattoman yhteentoimivuuden näkökulmasta on tärkeää, että järjestelmät ymmärtävät sairaalan tilat samalla tavoin.

## Nykytilanne

Sairaalahankkeen edetessä eri palvelutuotannon ohjauksen järjestelmiin on tehty tilaratkaisuja omista tarpeista käsin. Osaan, erityisesti INTO-hankkeen alaisiin sovelluksiin, on tehty yhteisiä tilatietoratkaisuja mutta kokonaisuudessaan eri järjestelmien ratkaisut eivät muodosta koherenttia kokonaisuutta. Tästä seuraa seuraavia ongelmia:

### Erilaiset digitaaliset mallinnukset sairaalasta

Sairaalan tuotannonohjaukseen ja tukitoimintoihin liittyvät tietojärjestelmät eivät hahmota fyysistä sairaalaa samalla tavoin. Järjestelmillä voi olla täysin omat tietokantansa, jossa tiloille on omat nimet, luokitukset ja tapansa mallintaa todellisuutta, tai tilatietoa on mallinnettu Modulo järjestelmän pohjalta. Tämä vaikeuttaa järjestelmien välisiä tiedonvaihtoja, kun tilatiedoille on rakennettava sovittimia. Lisäksi uusien tiloja hyödyntävien tietojärjestelmien käyttöönotto on hidasta, koska tiloista on joka kerta sovittava erikseen.

### Standardoimaton tiedonvälitys

Vaikka osa tuotannonohjaukseen liittyvistä järjestelmistä jakaa saman käsityksen sairaalan tiloista, tieto ei ole standardoidussa muodossa tai saatavilla standardoitujen rajapintaratkaisujen kautta. Tämä vaikeuttaa mm. tilojen liittämistä ajanvarauksiin, joka taas omalta osaltaan monimutkaistaa ajanvarauksiin liittyviä integraatioita.

### Tilaratkaisut erillään muusta tuotannonohjaustiedosta

Tilatieto on merkittävässä roolissa sairaalan tuotannonohjauksen kannalta kriittisimmän tiedon, ajanvarauksen, hallinnoinnissa. Uuden sairaalan toiminnan kannalta on tärkeää, että vuorosuunnittelu, sijoitussuunnittelu, ajanvaraus ja tilavaraus ovat prosesseina tiivisti toisiinsa kytkeytyneitä. Tämä edellyttää myös sitä, että rajapintaratkaisuissa on kyvykkyys tiiviiseen tietojen välittämiseen. Nykyiset ratkaisut eivät tue mm. ajanvarauksen ja tilavarauksen luontia ja löydettävyyttä optimaalisesti.

## Ratkaisu

Rakennetaan integraatioratkaisu, joka perustuu Modulossa oleviin perustietoihin ja joita täydennetään tarvittaessa muista järjestelmistä saaduilla tiedoilla. Tietomallina toimii FHIR ja rajapinnan toteutus tehdään REST menetelmällä. Standardoitujen ratkaisujen kautta tiedonvälitystä on mahdollista yksinkertaistaa ja myös edistää alustaratkaisujen kehittymistä. Tilarajapinta on vain yksi tuotannonohjauksen virtaviivaistamisen mahdollistavista  rajapinnoista ja on elintärkeä osa mm. ajanvarausten luontia ja lukemista. Ajanvarauksien hallinta taas on elintärkeä osa sairaalan tuotannonohjauksen optimointia.

Teknologianäkökulman lisäksi FHIR on tärkeä myös joustavuuden ja liiketaloudellisista syistä. Alustaratkaisun avulla järjestelmien vaihtaminen on helpompaa, kun lähde- ja kohdejärjestelmät eivät ole tiiviisti kytköksissä toisiinsa. Kansainvälisesti merkittävän tiedonsiirtostandardin tukeminen helpottaa järjestelmien vaihtoa ja vaihtoehtoina voi tulevaisuudessa olla myös muita kuin kansallisia ratkaisuja. Toisaalta kotimaiset ratkaisut hyötyvät kansainvälisten standardien ja määrittelyiden mukaisesti toteutetuista kansallisista ratkaisuista laajentaessaan toimintaansa ulkomaille.
