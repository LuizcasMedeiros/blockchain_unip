<%-- 
    Document   : inserir_endereco
    Created on : 20/10/2020, 08:19:21
    Author     : luizf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String cpf = request.getParameter("cpf");
    String user = request.getParameter("user");
    String senha = request.getParameter("senha");
    String celular = request.getParameter("celular");
    String data_nascimento = request.getParameter("data_nascimento");
    String cpf_responsavel = request.getParameter("cpf_responsavel");
    String cnpj = request.getParameter("cnpj");

%>
<html>
    <% String name = "Cadastro Cliente";%>
    <jsp:include page="_head.jsp">
        <jsp:param name="pageTitle" value="<%= name%>"/>
    </jsp:include>

    <body class="bg-gradient-dark">
        <div class="container">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Criar sua Conta!</h1>
                                </div>
                                <form id="cliente" name="cliente" class="user" method="post" action="inserir_cliente.do">
                                    <input type="hidden" name="nome" value="<%=nome%>"/>
                                    <input type="hidden" name="email" value="<%=email%>"/>
                                    <input type="hidden" name="user" value="<%=user%>"/>
                                    <input type="hidden" name="celular" value="<%=celular%>"/>
                                    <input type="hidden" name="data_nascimento" value="<%=data_nascimento%>"/>
                                    <input type="hidden" name="cpf" value="<%=cpf%>">
                                    <input type="hidden" name="senha" value="<%=senha%>"/>
                                    <input type ="hidden" name="cpf_responsavel" value="<%=cpf_responsavel%>"/>
                                    <input type ="hidden" name="cnpj" value="<%=cnpj%>"/>

                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input class="form-control form-control-user" id="cep" type="text"  placeholder="Cep" name="cep"  maxlength="9" OnKeyPress="formatar('#####-###', this)"   required/> 
                                        </div>
                                        <div class="col-sm-6">
                                            <input class="form-control form-control-user" id="cidade" type="text"  placeholder="Cidade" name="localidade" maxlength="100" required/> 
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input class="form-control form-control-user" id="bairro" type="text" placeholder="Bairro" name="bairro"  required/> 
                                    </div>  


                                    <div class="form-group">
                                        <input class="form-control form-control-user" id="rua" type="text" placeholder="Logradouro" name="logradouro"  required/> 
                                    </div>

                                    <div class="form-group">
                                        <input  class="form-control form-control-user" type="text" placeholder="Complemento" name="complemento" maxlength="255" /> 
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <input class="form-control form-control-user" id="uf" type="text" placeholder="Uf" name="uf"  required readonly/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox" id="checkbox_cnpj">

                                            <input type="checkbox" class="custom-control-input" id="termos_uso" required=>
                                            <label class="custom-control-label" for="termos_uso"><p><a  class="link_termos" data-toggle="modal" data-target="#myModal">Termos de uso com adquequação a LGPD (Marque para continuar)</a></p></label>
                                        </div> 
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control btn btn-primary btn-user btn-blocky" type="submit" value="Registar" />
                                    </div>
                                    <hr>
                                </form>
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="text-center pl-5">
                                                    <h5 class="modal-title text-center" id="ModalMostrar">Termos de uso com adquequação a LGPD</h5>
                                                    <hr>
                                                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 9.5rem;" src="assets/COINVEST.png" alt="">

                                                </div>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p class="text-justify">
                                                    Esta Política de Privacidade, "CoinvestB&P" refere-se à empresa COINVEST B&P EXCHANGE LTDA, incluindo, sem limitação, seus proprietários, diretores, investidores, empregados ou outras partes relacionadas. Dependendo do contexto, "CoinvestB&P" também pode se referir ao serviços, produtos, website, conteúdos ou outros materiais (coletivamente, "Serviços de Criptomoedas") fornecido pela Coinvest B&P. "Informações Pessoais" refere-se a informações que identificam um indivíduo, tal como o nome , detalhes do endereço, endereço de e-mail, informações sobre a negociação, e bancárias. "Informações Pessoais" não inclui dados agregados que não identifica um usuário. Coinvest B&P específico e suas afiliadas (doravante, "CoinvestB&P", "nós" ou "nosso") estão comprometidos em proteger e respeitar a sua privacidade. O objetivo desta Política de Privacidade é descrever:
                                                </p>
                                                <ul class="ml-5">
                                                    <li>Os tipos de informações pessoais que coletamos e como ela pode ser utilizada;</li>
                                                    <li>Nosso uso de cookies e tecnologia semelhante;</li>
                                                    <li>Como e por que nós podemos divulgar suas informações pessoais a terceiros;</li>
                                                    <li>Seu direito de acessar, corrigir, atualizar e excluir suas informações pessoais;</li>
                                                    <li>As medidas de segurança que usamos para proteger e evitar a perda, mau uso ou alteração de informações pessoais;</li>
                                                    <li>Armazenamento da sua informação pessoal na CoinvestB&P.</li>

                                                </ul>
                                                <h4 class="font-weight-bold text-center mt-5">COLETA E USO DE PESSOAL</h4>
                                                <h6 class="font-weight-bold mt-5">
                                                    AS INFORMAÇÕES PESSOAIS QUE COLETAMOS
                                                </h6>   
                                                <p class="text-justify">
                                                    As informações pessoais que você fornece diretamente para nós quando você abre uma conta na CoinvestB&P, ou realiza quaisquer transações na plataforma, ou utilizar outros serviços CoinvestB&P. Isto pode incluir:
                                                </p>
                                                <ul class="ml-5">
                                                    <li>Informações de contato, como nome, endereço residencial e endereço de e-mail.</li>
                                                    <li>Informações, como nome de usuário e senha da conta.</li>
                                                    <li>Informações financeiras, como números de contas bancárias, extrato bancário, e informações sobre a negociação.</li>
                                                    <li>Informações de verificação de identidade, tais como imagens de seu documento de identidade, passaporte, bilhete de identidade nacional, ou carta de condução.</li>
                                                    <li>Informações de verificação de residência, tais como detalhes de conta de luz ou informação similar.</li>

                                                </ul>
                                                <p class="text-justify">
                                                    Nós também coletamos automaticamente determinado computador, dispositivo e informações de navegação quando você acessar o site do CoinvestB&P ou ao utilizar nossos serviços. Esta informação é agregada para fornecer dados estatísticos sobre as ações de navegação dos nossos usuários e padrões, e não identifica pessoalmente o indivíduo. Esta informação pode incluir:
                                                    Computador ou informações sobre o dispositivo móvel, incluindo o endereço IP, sistema operacional, tipo de navegador.
                                                </p>
                                                <h4 class="font-weight-bold text-center mt-5">INFORMAÇÕES DE USO DO SITE</h4>
                                                <h6 class="font-weight-bold mt-5">
                                                    USO DE COOKIES E/OU TECNOLOGIA SEMELHANTE
                                                </h6>
                                                <p class="text-justify">
                                                   Cookies são pequenos arquivos de texto que são colocados no seu computador por sites que você visita. Eles são amplamente utilizados, a fim de fazer websites trabalho, ou trabalhar de forma mais eficiente, bem como para fornecer informações para os proprietários dos sites. Cookies são normalmente armazenados no disco rígido do seu computador. As informações coletadas a partir de cookies são usada por nós para avaliar a eficácia do nosso Site, analisar tendências e administrar a Plataforma. As informações coletadas a partir de cookies nos permite determinar coisas como quais partes do nosso site são mais visitadas e dificuldades os nossos visitantes podem experimentar em acessar o nosso site. Com esse conhecimento, podemos melhorar a qualidade de sua experiência na plataforma através do reconhecimento e entregar mais das características e informações mais desejadas, bem como por resolver as dificuldades de acesso. Nós utilizamos o suporte de uma empresa terceirizada(s), para ajudar-nos a compreender melhor o uso de nosso Site. Nosso fornecedor (es) serviço irá colocar cookies no disco rígido do seu computador e receberá informações que nós selecionamos que vai educar-nos em coisas como como os visitantes naveguem através de nosso site, o que produtos são navegados, e informações gerais Transação. Nosso fornecedor (es) serviço analisa esta informação e nos fornece relatórios agregados. A informação e análise fornecida pelo nosso provedor (es) serviço será usado para nos ajudar a compreender melhor os interesses dos nossos visitantes em nosso site e como melhor servir esses interesses. As informações recolhidas pelo nosso prestador (es) do serviço podem ser ligados e combinados com as informações que coletamos sobre você enquanto você estiver usando a plataforma. Nosso prestador (es) do serviço está / estão contratualmente impedidos de utilizar as informações que recebemos de nosso site que não seja para ajudar.  
                                                </p>
                                                <h6 class="font-weight-bold mt-5">
                                                    COMO SÃO USADAS SUAS INFORMAÇÕES PESSOAIS
                                                </h6>
                                                <p class="text-justify">
                                                   Processamento de transações na CoinvestB&P.
                                                </p>
                                                <ul class="ml-5">
                                                    <li>Iremos processar sua informação pessoal apenas para o propósito para o qual foram fornecidas.</li>
                                                    <li>Verificamos sua identidade principalmente para aplicação da nossa política antilavagem de dinheiro, bem como as diferentes necessidades de aplicação da lei conforme descrito detalhadamente em nossos Termos de Uso.</li>
                                                    <li>Personalizar a sua experiência de uso na CoinvestB&P.</li>
                                                    <li>Analisar a utilização do site, e melhorar o nosso serviços e ofertas.</li>
                                                    <li>Ajuda a responder às suas solicitações de serviço ao cliente e as necessidades de apoio.</li>
                                                    <li>Ao acionar o suporte dos nossos serviços, o endereço de e-mail que você fornece pode ser usado para comunicar informações e atualizações relacionadas ao seu uso da CoinvestB&P. Ocasionalmente, também podemos comunicar notícias da empresa, atualizações, promoções e informações relacionadas aos produtos e serviços similares fornecidos por nós.</li>
                                                    <li>Administrar uma promoção, pesquisa ou outros recursos do site.</li>
                                                    <li>Não executamos rastreamento comportamental das atividades de um cliente em nosso site ou através de diferentes sites.</li>
                                                </ul>
                                                <h6 class="font-weight-bold text-center mt-5">INFORMAÇÕES A TERCEIROS</h6>
                                                <p class="text-justify">
                                                    No processamento de suas transações, podemos compartilhar algumas de suas informações pessoais com terceiros prestadores de serviços que ajudam com nossas operações de negócios. As suas informações não serão vendidas, trocadas ou compartilhadas com terceiros sem o seu consentimento, exceto para fornecer serviços CoinvestB&P ou conforme exigido por lei. Ao utilizar nossos serviços e aceitar os nossos Termos de Uso, você concorda com a divulgação de suas informações pessoais, conforme descrito neste termo de Política de Privacidade. CoinvestB&P e prestadores de serviços estão contratualmente obrigados a proteger e utilizar essas informações apenas para os fins para os quais foram divulgados, exceto quando exigido ou permitido por lei. Temos asseguram que esse terceiro será vinculado por termos não menos protetor dos descritos nesta Política de Privacidade, ou aqueles que são objetos de acordo com as leis de proteção de dados aplicáveis.
                                                </p>
                                                <h6 class="font-weight-bold mt-5">
                                                    DIVULGAÇÕES A AUTORIDADES LEGAIS
                                                </h6>
                                                <p class="text-justify">
                                                    Podemos compartilhar suas informações pessoais com a aplicação da lei, as autoridades de proteção de dados, oficiais do governo e outras autoridades quando:
                                                </p>
                                                <ul class="ml-5">
                                                    <li>Compelido por intimação, ordem judicial ou outro procedimento legal.</li>
                                                    <li>Nós acreditamos que a divulgação é necessária para evitar danos físicos ou perda financeira.</li>
                                                    <li>A divulgação é necessária para relatar suspeita de atividade ilegal.</li>
                                                    <li>Divulgação é necessária para investigar as violações desta Política de Privacidade ou os nossos Termos de Uso.</li>
                                                </ul>
                                                <h4 class="font-weight-bold text-center mt-5">WEBSITES EXTERNOS</h4>
                                                <p class="text-justify">
                                                   Ocasionalmente, o site da CoinvestB&P pode fornecer referências ou links para outros sites ("Sites Externos"). Nós não controlamos esses sites externos sites de terceiros ou quaisquer dos conteúdos nelas contidas. Você concorda que nós não somos responsáveis pelos sites referenciados ou vinculados a partir do site CoinvestB&P, incluindo, mas não limitado a, o conteúdo do site, políticas, fracassos, promoções, produtos, serviços ou ações e / ou de quaisquer danos, perdas, falhas ou problemas causados por este, estejam relacionadas ou decorrentes desses sites. As políticas de privacidade são separadas e independentes. Nós encorajamos você a rever as políticas, normas, prazos e regulamentos de cada site que você visita. Procuramos proteger a integridade de nosso site e agradecemos qualquer feedback sobre informações Site Externo fornecida no site da CoinvestB&P.
                                                </p>
                                                <h4 class="font-weight-bold text-center mt-5">DIREITOS DE ACESSO A DADOS PESSOAIS</h4>   
                                                <p class="text-justify">
                                                    Você tem o direito de acessar suas informações pessoais para corrigir, atualizar e bloquear dados imprecisos e / ou incorretas. Para exercer esse direito, entre em contato conosco. A CoinvestB&P irá analisar e responder ao seu pedido apenas quando tal não seja incompatível com os nossos Termos de Uso e outras obrigações legais e regulamentares. Dentro de 15 dias após a recepção do seu pedido por escrito, iremos fornecer-lhe com sua informação pessoal, incluindo os fins para os quais foram utilizados e para quem foi divulgado (caso tenha sido).
                                                </p>
                                                <h4 class="font-weight-bold text-center mt-5">SEGURANÇA DAS INFORMAÇÕES PESSOAIS</h4>
                                                <p class="text-justify">
                                                   Nós usamos uma variedade de medidas de segurança para garantir a confidencialidade de suas informações pessoais, e para proteger suas informações pessoais contra perda, roubo, acesso não autorizado, uso indevido, alteração ou destruição. Estas medidas de segurança incluem, mas não estão limitados a: 
                                                </p>
                                                <ul class="ml-5">
                                                    <li>Senha diretórios e bancos de dados protegido.</li>
                                                    <li>Tecnologia Sockets camadas (SSL) para assegurar que sua informação é totalmente criptografado e enviado através da Internet de forma segura.</li>
                                                    <li>PCI Scanning para proteger ativamente os nossos servidores contra hackers e outras vulnerabilidades.</li>
                                                </ul>
                                               <p class="text-justify">
                                                  Todas as informações financeiramente sensíveis e / ou de crédito são transmitidos através da tecnologia SSL criptografado e no nosso banco de dados. Somente pessoal autorizado CoinvestB&P é permitido o acesso às suas informações pessoais, e esse pessoal são obrigados a tratar a informação como altamente confidencial. As medidas de segurança serão revistas regularmente à luz dos novos e relevantes desenvolvimentos jurídicos e técnicos.
                                               </p>
                                               <h4 class="font-weight-bold text-center mt-5">RETENÇÃO DE INFORMAÇÕES PESSOAIS</h4>
                                                <p class="text-justify">
                                                    Nós retemos informações pessoais durante o tempo que for necessário para cumprir os propósitos descritos nesta Política de Privacidade, sujeitas às nossas próprias obrigações legais e regulamentares. De acordo com as nossas obrigações de manutenção de registos, reteremos conta e outras informações pessoais para, pelo menos, cinco anos após uma conta é fechada.
                                                </p>
                                                <h4 class="font-weight-bold text-center mt-5">ATUALIZAÇÕES DA POLÍTICA DE PRIVACIDADE</h4>
                                                <p class="text-justify">
                                                   Esta Política de Privacidade pode ser revisto, modificado, atualizado e / ou completado a qualquer momento, sem aviso prévio, a critério exclusivo da CoinvestB&P. Quando fizermos alterações a esta Política de Privacidade, iremos notificar todos os usuários em nosso site, e publicar a Política de Privacidade alterada em nosso site. 
                                                </p>
                                                <h4 class="font-weight-bold text-center mt-5">DEFINIÇÕES</h4>
                                                <p class="text-justify">
                                                    Conta, refere-se ao acordo contratual em que um dos membros CoinvestB&P aceitou os nossos Termos de Uso e Política de Privacidade, e recebeu aprovação para utilizar os Serviços CoinvestB&P, incluindo a compra e venda de criptomoedas e utilizar a Plataforma Transações CoinvestB&P.
                                                </p>
                                                <p class="text-justify">
                                                    Plataforma CoinvestB&P: Tecnologias de hardware e software usados pela CoinvestB&P para fornecer o Serviço, tal como estabelecido em nossos Termos de Uso.
                                                </p>
                                                <p class="text-justify">
                                                    Informação pessoal: As informações que identificam um indivíduo, tais como nome, endereço, endereço de e-mail, informações sobre a negociação, e dados bancários. "Informações Pessoais" não inclui anonimizados e / ou dados agregados que não identificam um usuário específico.
                                                </p>
                                                <p class="text-justify">
                                                    Serviços: A plataforma tecnológica, as regras funcionais e mercado geridos pela CoinvestB&P para permitir que vendedores e compradores para realizar transações de compra e venda de criptomoedas.
                                                </p>
                                                <p class="text-justify">
                                                    Transação: Inclui o seguinte:
                                                </p>
                                                <ul class="ml-5">
                                                    <li>O acordo entre o comprador e o vendedor para trocar criptomoedas através do Serviço de moedas a uma taxa, cujo esse está descriminado no site ("Compra").</li>
                                                    <li>A conversão de moedas em criptomoedas depositados pelos membros em sua conta ("operação de conversão").</li>
                                                    <li>A transferência de criptomoedas entre os Membros ("Transferência/Retirada/Envio de Transação em Criptomoedas").</li>
                                                    <li>A compra de produtos auxiliares ("transações de compra").</li>
                                                </ul>
                                            </div>				  
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="login.jsp">Já tem uma conta? Entre!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="javascript/js/sb-admin-2.min.js"></script>

    </body>
</html>


