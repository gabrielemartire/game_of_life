# Game of Life
[wikipedia.org/wiki/Conway's_Game_of_Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)

## inizializzazione progetto 

> [!NOTE]
> Ruby@3.3

### 1. Creazione del Gemfile
- Crea un file `Gemfile` nella directory del progetto utilizzando il comando: `bundle init`
- Nel file `Gemfile` assicurati di avere la seguente riga: `source 'https://rubygems.org'`

### 2. Gemma io-console
La gemma io-console è necessaria per gestire gli input da console. 
- Aggiungi al `Gemfile` con `add "io-console"`
- Ora mel file `Gemfile` assicurati di avere la seguente riga: `gem 'io-console'`

Maggiori informazioni sulla gemma `io-console` sono disponibili nella [repo ufficiale](https://github.com/ruby/io-console)

### 3. Dipendenze
Per installare tutte le gemme elencate nel `Gemfile`, esegui: `bundle install`
> [!CAUTION]
> in caso di errore eliminare `Gemfile.lock` poi eseguire `bundle install`

## Esecuzione del Progetto da console
```bash
ruby main.rb
```

### output
![CleanShot 2024-09-22 at 15 43 30](https://github.com/user-attachments/assets/48dc4493-869f-4fec-805e-b08a37ce1f4f)

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

