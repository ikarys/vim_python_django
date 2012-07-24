" Chargement de pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Activation de l'indentation automatique
set autoindent

" Redéfinition des tabulations
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8

" Activation de la détection automatique du type de fichier
filetype on
filetype plugin indent on

" Longueur maximale des lignes
set textwidth=79

" Activation de la coloration syntaxique
syntax on

" Lecture des raccourcis clavier généraux
execute 'source '. $HOME . '/.vim/shortkeys.vim'

" Activation de la complétion pour les fichiers python
au FileType python set omnifunc=pythoncomplete#Complete

" Activation de la complétion pour les fichiers javascript
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" Activation de la complétion pour les fichiers html
au FileType html set omnifunc=htmlcomplete#CompleteTags

" Activation de la complétion pour les fichiers css
au FileType css set omnifunc=csscomplete#CompleteCSS

" Définition du type de complétion de SuperTab
let g:SuperTabDefaultCompletionType = "context"

" Activation de la visualisation de la documentation
set completeopt=menuone,longest,preview

" Activation de la complétion pour Django
function! SetAutoDjangoCompletion()
    let l:tmpPath   = split($PWD, '/')
    let l:djangoVar = tmpPath[len(tmpPath)-1].'.settings'
    let $DJANGO_SETTINGS_MODULE=djangoVar
    echo 'Activation de la complétion Django avec '.djangoVar
    return 1
endfunction

" Actvation des snippets Django pour les fichiers python et html
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.html

" Activation de la barre de statut de fugitive (gestion de git)
set laststatus=2
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" Fonction d'affichage d'un message en inverse video
function! s:DisplayStatus(msg)
    echohl Todo
    echo a:msg
    echohl None
endfunction

" Variable d'enregistrement de l'état de la gestion de la souris
let s:mouseActivation = 1

" Fonction permettant l'activation / desactivation de la gestion de la souris
function! ToggleMouseActivation()
    if (s:mouseActivation)
        let s:mouseActivation = 0
        set mouse=n
        set paste
        call s:DisplayStatus('Désactivation de la gestion de la souris (mode collage)')
    else
        let s:mouseActivation = 1
        set mouse=a
        set nopaste
        call s:DisplayStatus('Activation de la gestion de la souris (mode normal)')
    endif
endfunction

" Activation par défaut au démarrage de la gestion de la souris
set mouse=a
set nopaste

" Fonction de 'nettoyage d'un fichier :
"   - remplacement des tabulations par des espaces
"   - suppression des caractères ^M en fin de ligne
function! CleanCode()
    %retab
    %s/^M//g
    call s:DisplayStatus('Code nettoyé')
endfunction

" Affichage des numéros de ligne
set number
highlight LineNr ctermbg=blue ctermfg=gray

" Surligne la colonne du dernier caractère autorisé par textwidth
set cc=+1

" Définition de l'état de l'affichage de l'aide mémoire
let reminderDisplay = 0

" Fonction de lecture et d'affichage de l'aide mémoire
function! Reminder()
    if g:reminderDisplay == 0
        silent! topleft vertical 40 split +buffer Reminder
        let g:reminderDisplay = 1
        set buftype=nofile
        0read $HOME/.vim/plugin/reminder/reminder.txt
        set nonumber
        highlight Memory ctermfg=white ctermbg=blue
        3match Memory /^.\+\ \+:/
    else
        bdelete Reminder
        let g:reminderDisplay = 0
    endif
endfunction

" Définition du raccourcis par défaut
if !hasmapto('<Plug>Reminder')
    map <unique> <F1> <Plug>Reminder
    imap <unique> <F1> <Plug>Reminder
endif

nnoremap <unique> <script> <Plug>Reminder :call Reminder()<CR>
" }}}

