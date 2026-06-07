.URL:
    .string  "https://kirka.io"
activate:
# (rdi) (GtkApplication *) app, (rsi) (void *) user_data (unused)
    pushq    %rbx  # (preserve)

    call     gtk_application_window_new@PLT  # (rax) (GtkWidget *) window
    movq     %rax, %rbx                      # (rbx) (GtkWidget *) window

    movq     %rax, %rdi                # (GtkWindow *) window
    leaq     .URL(%rip), %rsi          # (char *) "https://kirka.io"
    call     gtk_window_set_title@PLT  # (void)

    movq     %rbx, %rdi                       # (GtkWindow *) window
    movl     $1280, %esi                      # (int) 1280
    movl     $720, %edx                       # (int) 720
    call     gtk_window_set_default_size@PLT  # (void)

    call     webkit_web_view_new@PLT  # (rax) (GtkWidget *) web_view
    pushq    %rax                     # (GtkWidget *) web_view
    pushq    %rbp                     # (align stack)

    movq     %rbx, %rdi                # (GtkWindow *) window
    movq     %rax, %rsi                # (GtkWidget *) web_view
    call     gtk_window_set_child@PLT  # (void)

    popq     %rbp                          # (align stack)
    popq     %rdi                          # (GtkWidget *) web_view
    leaq     .URL(%rip), %rsi              # (char *) "https://kirka.io"
    call     webkit_web_view_load_uri@PLT  # (void)

    movq     %rbx, %rdi              # (GtkWindow *) window
    popq     %rbx                    # (preserve)
    jmp      gtk_window_present@PLT  # (void)
# activate

.APP:
    .string  "n.k"
.SIG:
    .string  "activate"
    .globl   main
main:
# (void)
    pushq    %rbx  # (preserve)

    leaq     .APP(%rip), %rdi         # (char *) "n.k"
    xorl     %esi, %esi               # (int) 0
    call     gtk_application_new@PLT  # (rax) (GApplication *) app
    pushq    %rax                     # (GApplication *) app
    pushq    %rbp                     # (align stack)

    movq     %rax, %rdi                 # (GApplication *) app
    leaq     .SIG(%rip), %rsi           # (char *) "activate"
    leaq     activate(%rip), %rdx       # (void (*)(void)) activate
    xorl     %r8d, %r8d                 # (void *) 0
    xorl     %r9d, %r9d                 # (void *) 0
    xorl     %ecx, %ecx                 # (int) 0
    call     g_signal_connect_data@PLT  # (void)

    popq     %rbp                   # (align stack)
    popq     %rdi                   # (GApplication*) app
    xorl     %edx, %edx             # (void *) 0
    xorl     %esi, %esi             # (int) 0
    call     g_application_run@PLT  # (rax) (int) exit_code

    ####     g_object_unref is omitted to reduce code size

    popq     %rbx  # (preserve)
    ret            # (eax)
# main

# $ size ./main
#   text    data     bss     dec     hex filename
#   2674     912       8    3594     e0a ./main
