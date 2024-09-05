<?php

namespace App\Controller;

use Psr\Log\LoggerInterface;
use App\Entity\Pharmacie;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class LoginController extends AbstractController
{
    private $entityManager;
    private $logger;

    public function __construct(EntityManagerInterface $entityManager,LoggerInterface $logger)
    {
        $this->entityManager = $entityManager;
        $this->logger = $logger;
    }
    #[Route('/logins', name: 'logine')]
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        
        $error = $authenticationUtils->getLastAuthenticationError();

        // dernier nom d'utilisateur entré par l'utilisateur
        $lastUsername = $authenticationUtils->getLastUsername();
        return $this->render('admin/index.html.twig', [
            'last_username' => $lastUsername,
            'error' => $error,
        ]);
        
    }
    #[Route('/login', name: 'login')]
    public function log_in(AuthenticationUtils $authenticationUtils): Response
    {
        $error = $authenticationUtils->getLastAuthenticationError();

        // dernier nom d'utilisateur entré par l'utilisateur
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('admin/indexs.html.twig', [
            'last_username' => $lastUsername,
            'error' => $error,
        ]);
        
    }

    #[Route('/logout', name: 'app_logout')]

    public function logout()
    {
        // Ce code ne sera jamais exécuté, Symfony gère la déconnexion automatiquement.
        throw new \Exception('This should never be reached!');
    }
    
}
