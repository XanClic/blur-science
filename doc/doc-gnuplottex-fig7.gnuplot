set terminal pdf size 7cm, 4cm
set output 'doc-gnuplottex-fig7.pdf'
    set title "{0.02, 0.2, 0.8, 1.0, 0.8, 0.2, 0.02}"
    plot "large-kernel.data" title ""
