.data
    matrice:                        .fill 1600
    roles:                          .space 1600
    queue:                          .space 400
    visited:                        .fill 400
    n:                              .space 4
    nrMuchii:                       .space 4
    left:                           .space 4
    right:                          .space 4
    index_linie:                    .space 4
    index_coloana:                  .space 4
    queueLen:                       .space 4
    queueIndx:                      .space 4
    currentNode:                    .space 4
    columnIndex:                    .space 4
    nr_problema:                    .space 4
    nod1:                           .space 4
    nod2:                           .space 4
    index:                          .space 4
    element_roles:                  .space 4
    index1:                         .space 4
    index2:                         .space 4
    strlen:                         .space 4
    mesaj:                          .space 20
    mesaj_criptat:                  .space 20
    formatString:                   .asciz "%s"
    formatScanf:                    .asciz "%d"
    stringYes:                      .asciz "Yes"
    stringNo:                       .asciz "No"
    formatStringNewline:            .asciz "\n%s"
    formatPrintf:                   .asciz "%d\n"
    switch_malitios:                .asciz "switch malitios index "
    controller_index:               .asciz "controller index "
    host_index:                     .asciz "host index "
    alt_host_index:                 .asciz "host index "
    switch_index:                   .asciz "switch index "
    doua_puncte:                    .asciz ": "
    punct_si_virgula_si_spatiu:     .asciz "; "
    endl:                           .asciz "\n"
    debug:                          .asciz "am ajuns la nr problemei "
    
.text

.global main

main:
    # scanf("%d", n)
    pushl               $n
    push                $formatScanf
    call                scanf
    popl                %ebx
    popl                %ebx

    # scanf("%d", nrMuchii)
    pushl               $nrMuchii
    push                $formatScanf
    call                scanf
    popl                %ebx
    popl                %ebx

    # initializarea cu 0 e facuta cu acel fill, deci citim nodurile left si right
    lea                 matrice, %edi
    movl                $0, index

# for(index = 0; index < nrMuchii; i++){
#         scanf("%d", left);
#         scanf("%d", right);
#
#        matrice[left][right] = matrice[right][left] = 1;
# }

citire_muchii:
    movl                index, %ecx
    cmp                 nrMuchii, %ecx
    je                  pregatire_roles

    #  scanf("%d", left);
    pushl               $left
    push                $formatScanf
    call                scanf
    popl                %ebx
    popl                %ebx

    # scanf("%d", right);
    pushl               $right
    push                $formatScanf
    call                scanf
    popl                %ebx
    popl                %ebx

    # matrice[left][right] = 1
    # %eax -> elementul matrice[left][right] => left * n + right

    movl                left, %eax
    mull                n
    addl                right, %eax
    movl                $1, %ebx
    movl                %ebx, (%edi, %eax, 4)

    # matrice[right][left] = 1
    # elementul matrice[right][left] => right * n + left

    movl                right, %eax
    mull                n
    addl                left, %eax
    movl                $1, %ebx
    movl                %ebx, (%edi, %eax, 4)

    incl                index
    jmp                 citire_muchii

pregatire_roles:
    lea                 roles, %edi
    movl                $0, index
    jmp                 citire_vector_roles

    # citire roles

# for(i = 0; i < n; i++){
#    f >> roles[i];
# }

citire_vector_roles:
    movl                index, %ecx
    cmp                 n, %ecx
    je                  citire_nr_problema

    # scanf("%d", roles[i])

    pushl               $element_roles
    push                $formatScanf
    call                scanf
    popl                %ebx
    popl                %ebx

    # roles[i] = element_roles

    movl                index, %ecx
    movl                element_roles, %edx
    movl                %edx, (%edi, %ecx, 4)

    incl                index
    jmp                 citire_vector_roles

citire_nr_problema:
    # scanf("%d", nr_problema)
    pushl               $nr_problema
    push                $formatScanf
    call                scanf
    popl                %ebx
    popl                %ebx

    jmp                 switch_citire_nr_problema

switch_citire_nr_problema:
    movl                nr_problema, %eax
    cmp                 $1, %eax
    je                  nota_5

    cmp                 $2, %eax
    je                  nota_7

    cmp                 $3, %eax
    je                  nota_10


nota_5:
    movl                    $0, index1
    lea                     roles, %esi
    lea                     matrice, %edi

    for_roles:
        movl                index1, %ecx
        cmp                 n, %ecx
        je                  et_exit

        movl                $3, %edx
        cmp                 %edx, (%esi, %ecx, 4)
        je                  afiseaza
        jne                 continua_for_roles

    afiseaza:
        push                $switch_malitios
        push                $formatString
        call                printf
        popl                %ebx
        popl                %ebx

        pushl               $0
        call                fflush
        popl                %ebx

        pushl               index1
        push                $formatScanf
        call                printf
        popl                %ebx
        popl                %ebx

        pushl               $0
        call                fflush
        popl                %ebx

        push                $doua_puncte
        push                $formatString
        call                printf
        popl                %ebx
        popl                %ebx

        pushl               $0
        call                fflush
        popl                %ebx

        #  pornirea forului 2
        movl                index1, %ecx
        movl                $0, index2
        jmp                 for_matrice

    for_matrice:
        movl                index2, %ecx
        cmp                 n, %ecx
        je                  afisare_spatiu_dupa_continuare_for_roles

        # matrice[i][j] == 1
        # eax = n * index1 + index2

        movl                n, %eax
        mull                index1
        addl                index2, %eax     # %eax = matrice[i][j]

        movl                $1, %ebx
        movl                (%edi, %eax, 4), %edx
        cmp                 %edx, %ebx
        je                  afisare_index
        jne                 continua_for_matrice

    afisare_index:
        movl        index2, %ecx

        movl        (%esi, %ecx, 4), %edx
        cmp         $1, %edx                # daca e 1 e host index
        je          afisare_host_index

        cmp         $2, %edx                # daca e 2 e switch index
        je          afisare_switch_index

        cmp         $3, %edx
        je          afisare_switch_malitios

        cmp         $4, %edx               # daca e 4 e controller index
        je          afisare_controller_index

    afisare_host_index:
        # cout << "host index " << j << "; ";

        # afisez host index
        push            $host_index
        push            $formatString
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        # afisez j
        pushl           index2
        push            $formatScanf
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        # afisez ; 
        push            $punct_si_virgula_si_spatiu
        push            $formatString
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        # continui for matrice
        jmp             continua_for_matrice

    afisare_switch_malitios:
        # afisez switch malitios index
        push            $switch_malitios
        push            $formatString
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        # afisez j
        pushl           index2
        push            $formatScanf
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        # afisez ; 
        push            $punct_si_virgula_si_spatiu
        push            $formatString
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        # continui for matrice
        jmp             continua_for_matrice

    afisare_switch_index:
        # cout << "switch index " << j << "; ";

        # afisez host index
        push            $switch_index
        push            $formatString
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        # afisez j
        pushl           index2
        push            $formatScanf
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        # afisez ; 
        push            $punct_si_virgula_si_spatiu
        push            $formatString
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        # continui for matrice
        jmp             continua_for_matrice

    afisare_controller_index:
        # cout << "controller index " << j << "; ";

        # afisez host index
        push            $controller_index
        push            $formatString
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        # afisez j
        pushl           index2
        push            $formatScanf
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        # afisez ; 
        push            $punct_si_virgula_si_spatiu
        push            $formatString
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        # continui for matrice
        jmp             continua_for_matrice


    afisare_spatiu_dupa_continuare_for_roles:

        push                $endl
        push                $formatString
        call                printf
        popl                %ebx
        popl                %ebx

        push                $0
        call                fflush
        popl                %ebx


        jmp                 continua_for_roles


    continua_for_matrice:
        incl                index2
        jmp                 for_matrice
    

    continua_for_roles:
        incl                index1
        jmp                 for_roles


nota_7:

    #        queue[queueLen] = 0;
    #        queueLen ++;
    #        visited[0] = 1;

    #        while(queueIndx != queueLen){ // primul while
    #            currentNode = queue[queueIndx];
    #            if(roles[currentNode] == 1){
    #                cout << "host index " << currentNode << "; ";
    #            }

    #            columnIndex = 0;
    #            while(columnIndex < n){    // al doilea while
    #                if (matrice[currentNode][columnIndex] == 1){
    #                    if(visited[columnIndex] != 1){
    #                        queue[queueLen] = columnIndex;
    #                        queueLen = queueLen + 1;
    #                        visited[columnIndex] = 1;
    #                    }
    #                }
    #                columnIndex ++;
    #            }
    #            queueIndx ++;
    #        }


    lea                 queue, %edi
    movl                $0, queueLen

    #        queue[queueLen] = 0;

    movl                $0, %eax
    movl                queueLen, %ecx
    movl                %eax, (%edi, %ecx, 4)

    #        queueLen ++;
    incl                queueLen
    
    #        visited[0] = 1;
    lea                 visited, %edi
    movl                $1, %eax
    movl                $0, %ecx
    movl                %eax, (%edi, %ecx, 4)

    #        while(queueIndx != queueLen){
    primul_while:
        movl            queueIndx, %ecx
        cmp             queueLen, %ecx
        je              pregatire_parcurgere_visited

    #            currentNode = queue[queueIndx];
        lea             queue, %edi
        movl            (%edi, %ecx, 4), %edx
        movl            %edx, currentNode

    #            roles[currentNode] == 1{
        lea             roles, %edi
        movl            currentNode, %ecx
        movl            $1, %edx
        cmp             %edx, (%edi, %ecx, 4)
        je              afisare_host_index2
        jne             continuare_interior_primul_while

    afisare_host_index2:
    #                cout << "host index " << currentNode << "; ";
        push            $alt_host_index
        push            $formatString
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        pushl           currentNode
        push            $formatScanf
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush   
        popl            %ebx

        push            $punct_si_virgula_si_spatiu
        pushl           $formatString
        call            printf  
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        movl            currentNode, %ecx

    continuare_interior_primul_while:
    #            columnIndex = 0;     
        movl            $0, columnIndex

    #            while(columnIndex < n){    // al doilea while
        al_doilea_while:
            movl            columnIndex, %ecx
            cmp             n, %ecx
            je              continua_primul_while
    
    #                (matrice[currentNode][columnIndex] == 1){
            lea             matrice, %edi

            #   %eax = n * currentnode + columnIndex
            movl            n, %eax
            mull            currentNode
            addl            columnIndex, %eax

            movl            $1, %edx
            cmp             (%edi, %eax, 4), %edx
            je              al_doilea_if
            jne             continua_al_doilea_while

        al_doilea_if:
    #                    if(visited[columnIndex] != 1)        
            lea             visited, %edi
            movl            columnIndex, %ecx
            movl            $1, %eax
            cmp             (%edi, %ecx, 4), %eax
            jne             interior_al_doilea_if
            je              continua_al_doilea_while

            interior_al_doilea_if:
    #                        queue[queueLen] = columnIndex;
            lea             queue, %edi
            movl            queueLen, %ecx
            movl            columnIndex, %edx
            movl            %edx, (%edi, %ecx, 4)

    #                        queueLen = queueLen + 1;
            incl            queueLen  

    #                        visited[columnIndex] = 1;
            lea             visited, %edi
            movl            columnIndex, %ecx
            movl            $1, %edx
            movl            %edx, (%edi, %ecx, 4)

        continua_al_doilea_while:
            incl            columnIndex
            jmp             al_doilea_while

    continua_primul_while:
        incl            queueIndx
        jmp             primul_while

    pregatire_parcurgere_visited:
        lea             visited, %edi
        movl            $0, index

        parcurgere_visited:
            movl            index, %ecx
            cmp             n, %ecx
            je              da_exit

            movl            $0, %edx
            cmp             %edx, (%edi, %ecx, 4)
            je              nu_exit
            jne             continuare_parcurgere_visited

    continuare_parcurgere_visited:
        incl            index
        jmp             parcurgere_visited
    
    nu_exit:
            push            $stringNo
            push            $formatStringNewline
            call            printf
            popl            %ebx
            popl            %ebx

            pushl           $0
            call            fflush
            popl            %ebx

            jmp             et_exit
            
    da_exit:
            push            $stringYes
            push            $formatStringNewline
            call            printf
            popl            %ebx
            popl            %ebx

            pushl           $0
            call            fflush
            popl            %ebx

            jmp             et_exit
    
nota_10:
    #        cin >> nod1;
    #        cin >> nod2;
    #        cin.get();
    #        cin.getline(mesaj, 400);


    #        queue[queueLen] = nod1;
    #        queueLen ++;
    #        visited[0] = 1;

    #        while(queueIndx != queueLen){
    #            currentNode = queue[queueIndx];

    #            columnIndex = 0;
    #            while(columnIndex < n){
    #                if (matrice[currentNode][columnIndex] == 1){
    #                    if(visited[columnIndex] == 0 && roles[currentNode] != 3){
    #                        queue[queueLen] = columnIndex;
    #                        queueLen = queueLen + 1;
    #                        visited[columnIndex] = 1;
    #                    }
    #                }
    #                columnIndex ++;
    #            }
    #            queueIndx ++;
    #        }
    #        if(visited[nod2] == 0){
    #            // nu e bun
    #            cout << "nu e bun"<< endl;
    #        }
    #        else{
    #            // e bun
    #            cout << mesaj << endl;
    #        }


    #        cin >> nod1;
    pushl               $nod1
    push                $formatScanf
    call                scanf
    popl                %ebx
    popl                %ebx

    #        cin >> nod2;
    pushl               $nod2
    push                $formatScanf
    call                scanf
    popl                %ebx
    popl                %ebx

    #       citirea mesajului
    push                $mesaj
    push                $formatString
    call                scanf
    popl                %ebx
    popl                %ebx

    #       comparam nod1, nod2, daca nod2 e mai mare, faci switch
    movl                nod1, %eax
    movl                nod2, %ebx
    cmp                 %ebx, %eax
    jg                  swap_noduri

    swap_noduri:
        movl            nod1, %eax
        movl            nod2, %ebx
        movl            %ebx, nod1
        movl            %eax, nod2
    
    lea                 queue, %edi
    movl                $0, queueLen

    #        queue[queueLen] = nod1;

    movl                nod1, %eax
    movl                queueLen, %ecx
    movl                %eax, (%edi, %ecx, 4)

    #        queueLen ++;
    incl                queueLen

    #        visited[0] = 1;
    lea                 visited, %edi
    movl                $1, %eax
    movl                $0, %ecx
    movl                %eax, (%edi, %ecx, 4)

    #        while(queueIndx != queueLen){
    nota_10_primul_while:
        movl            queueIndx, %ecx
        cmp             queueLen, %ecx
        je              conditie_finala

    #            currentNode = queue[queueIndx];
        lea             queue, %edi
        movl            (%edi, %ecx, 4), %edx
        movl            %edx, currentNode
    
    #            columnIndex = 0;     
        movl            $0, columnIndex

    #            while(columnIndex < n){    // al doilea while
        nota_10_al_doilea_while:
            movl            columnIndex, %ecx
            cmp             n, %ecx
            je              continua_nota_10_primul_while
    
    #                (matrice[currentNode][columnIndex] == 1){
            lea             matrice, %edi

            #   %eax = n * currentnode + columnIndex
            movl            n, %eax
            mull            currentNode
            addl            columnIndex, %eax

            movl            $1, %edx
            cmp             (%edi, %eax, 4), %edx
            je              nota_10_al_doilea_if
            jne             continua_nota_10_al_doilea_while

        nota_10_al_doilea_if:
    #                    if(visited[columnIndex] == 0 && roles[currentNode] != 3)
            lea             visited, %edi
            movl            columnIndex, %ecx
            movl            $0, %eax
            cmp             (%edi, %ecx, 4), %eax
            je              nota_10_a_doua_conditie_al_doilea_if
            jne             continua_nota_10_al_doilea_while

            nota_10_a_doua_conditie_al_doilea_if:

            lea             roles, %edi
            movl            currentNode, %ecx
            movl            $3, %eax
            cmp             (%edi, %ecx, 4), %eax
            jne             interior_nota_10_al_doilea_if
            je              continua_nota_10_al_doilea_while

            interior_nota_10_al_doilea_if:
    #                        queue[queueLen] = columnIndex;
            lea             queue, %edi
            movl            queueLen, %ecx
            movl            columnIndex, %edx
            movl            %edx, (%edi, %ecx, 4)

    #                        queueLen = queueLen + 1;
            incl            queueLen  

    #                        visited[columnIndex] = 1;
            lea             visited, %edi
            movl            columnIndex, %ecx
            movl            $1, %edx
            movl            %edx, (%edi, %ecx, 4)

        continua_nota_10_al_doilea_while:
            incl            columnIndex
            jmp             nota_10_al_doilea_while


    continua_nota_10_primul_while:
        incl            queueIndx
        jmp             nota_10_primul_while
    

    conditie_finala:
        #   if(visited[nod2] == 0)
        lea             visited, %edi
        movl            nod2, %ecx
        movl            $0, %eax
        cmp             (%edi, %ecx, 4), %eax
        je              interior_conditie_valida
        jne             interior_else

    interior_conditie_valida:
        # mesajul criptat
        lea             mesaj, %edi
        lea             mesaj_criptat, %esi

        movl            $0, index

        for_string:
            movl        index, %ecx
            mov         (%edi, %ecx, 1), %al
            cmp         $0, %al
            je          print

            subb        $10, %al
            cmp         $97, %al    # compar cu 'a'
            jb          modificare
            jmp         continuare_for_string

        modificare:
            # char[i] = char[i] + 'z' - 'a' + 1
            addb        $122, %al
            subb        $97, %al
            addb        $1, %al
            jmp         continuare_for_string

        continuare_for_string:
            mov         %al, (%esi, %ecx, 1)
            incl        index
            jmp         for_string

        print:
            push        $mesaj_criptat
            push        $formatString
            call        printf
            popl        %ebx
            popl        %ebx

            pushl       $0
            call        fflush
            popl        %ebx

            jmp         et_exit

    interior_else:
        # mesajul propriu zis
        push            $mesaj
        push            $formatString
        call            printf
        popl            %ebx
        popl            %ebx

        pushl           $0
        call            fflush
        popl            %ebx

        jmp             et_exit
           
et_exit:
    movl                $1, %eax
    xor                 %ebx, %ebx
    int                 $0x80

