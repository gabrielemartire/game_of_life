# Game of Life
[wikipedia.org/wiki/Conway's_Game_of_Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)

## Installazione (phase 1)

### 1. Creazione del Gemfile
Per iniziare, crea un file `Gemfile` nella directory del progetto utilizzando il comando:
```bash
bundle init
```

Nel file `Gemfile` assicurati di avere la seguente riga:
```ruby
source 'https://rubygems.org'
```

### 2. Aggiungere la gemma io-console
La gemma io-console è necessaria per gestire gli input da console. Aggiungila al `Gemfile` con questa riga:
```bash
add "io-console" 
```
Ora mel file `Gemfile` assicurati di avere la seguente riga:
```ruby
gem 'io-console'
````
Maggiori informazioni sulla gemma `io-console` sono disponibili nella [repo ufficiale](https://github.com/ruby/io-console)

### 3. Installazione delle dipendenze
Per installare tutte le gemme elencate nel Gemfile, esegui:
```bash
bundle install --path vendor/bundle
```

## Esecuzione del Progetto (phase 1)
### Una volta che tutto è pronto, puoi eseguire il programma con il seguente comando:
```bash
ruby app/main.rb
```

### output
![CleanShot 2024-09-22 at 15 43 30](https://github.com/user-attachments/assets/48dc4493-869f-4fec-805e-b08a37ce1f4f)

## webapp (phase 2)
### Gemma `divise`
[devise#getting-started](https://github.com/heartcombo/devise?tab=readme-ov-file#getting-started)
- eseguendo questo comando predisporrà tutto però l'uso di devise
```bash
bundle add devise
```
aggiungendo automaticamente al Gemfile la gemma [divise](https://github.com/heartcombo/devise)
```ruby
gem "devise", "~> 4.9"
```
- prima di procedere a generare i file di configurazione di devise con `rails generate devise:install`
- verifico la presenza di Rails con `rails -v`
- ma mi dice:
```bash
❯ rails -v
Rails is not currently installed on this system. To get the latest version, simply type:
    $ sudo gem install rails
```
- ma procedendo con `sudo gem install rails` mi da diversi errori:

* passiamo quindi alle azioni necessarie aggiuntive: *
- installiamo (mise)[https://mise.jdx.dev/] (tramite brew) per la gestione dei pacchetto ruby
- passiamo alla versione di ruby che ci occorre con il comando `mise install ruby@3.3`
> [!CAUTION]
> se da errore, installare openssl con `brew install openssl@1.1`: 
> poi `code ~/.config/fish/config.fish`, inserendo questa riga `fish_add_path /opt/homebrew/opt/openssl@1.1/bin` dopo le altre `fish_add_path`
- riprovare con `mise install ruby@3.3`
> [!CAUTION]
> se da errore installa libyaml con `brew install libyaml`
- ora `mise install ruby@3.3` dovrebbe funzionare

PROSEGUIAMO
- `bundle install` aggiungerà una vagonata di file
- perche la gemma devise non è autonoma e si affida ad altre gemme, come warden per la gestione delle sessioni, e altre librerie per il funzionamento corretto.
- Dipendenze del framework Rails: Rails stesso ha molte dipendenze per gestire cose come il routing, l'ORM, la gestione delle viste, ecc. Se stai usando altre gemme nel progetto, anche queste installeranno le loro dipendenze.

ALCUNE GEMME CHIAVE DA APPROFONDIRE
- [ ] actionpack (6.1.7.8) e actionview (6.1.7.8): gestione del routing, controller e views.
- [ ] activesupport (6.1.7.8).
- [ ] nokogiri (1.13.10)
- [ ] loofah (2.22.0)
- [ ] responders (3.1.1) usata da Devise

> [!CAUTION]
> potresti non avere rails - ancora - quindi `sudo gem install rails` + password
> [!CAUTION]
> potresti aver installato la versione di ruby necessaria (3.3) ma non essere passato alla versione 3.3 quindi `mise use -g ruby@3.3`
- E finalmente abbiamo rails installato
- aggiungiamo rails al progetto `rails new . --force`
  - L'opzione `.` indica di installare Rails nella directory corrente.
  - `--force` sovrascriverà i file esistenti in conflitto.

- procediamo con devise
- la guida dice di eseguire `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }`
- [ ] capire perche non sminchia con docker ecc
- 

### REQ
- autenticazione (gemma devise)
- upload del file di input (con validazione formato ingresso)
- matrice di punti  variabile in base al formato del file d'ingresso
- visualizzazione della matrice
- tasto start per far partire le iterazioni
- visualizzazione delle generazioni (calcolate lato server)


## Link utili
### Utilizzo della Gemma io-console
Alcune risorse utili per comprendere come utilizzare `io-console`:
- https://ruby-doc.com/3.0.7/exts/io/console/IO.html
- https://ruby-doc.org/stdlib-2.6.3/libdoc/io/console/rdoc/IO.html
- https://ruby-doc.com/3.0.7/exts/io/console/IO.html#method-i-raw
- https://gist.github.com/acook/4190379#file-keypress-rb-L10
### Gestione degli input da tastiera
- https://gist.github.com/acook/4190379
- https://stackoverflow.com/questions/6556280/read-input-from-console-in-ruby

