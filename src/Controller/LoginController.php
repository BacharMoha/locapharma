<?php

namespace App\Controller;

use Psr\Log\LoggerInterface;
use App\Entity\Pharmacie;
use App\Entity\UserOrdrePharma;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
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


    #[Route('/logout', name: 'app_logout')]

    public function logout()
    {
        // Ce code ne sera jamais exécuté, Symfony gère la déconnexion automatiquement.
        throw new \Exception('This should never be reached!');
    }
    #[Route('/ordrelogin', name: 'ordrelogin')]
    public function ordrelogin(Request $request, EntityManagerInterface $entityManager, UserPasswordHasherInterface $passwordHasher): JsonResponse
    {
        // Récupérer les données JSON du formulaire
        $data = json_decode($request->getContent(), true);
        $email = $data['email'] ?? '';
        $password = $data['password'] ?? '';

        // Chercher l'utilisateur en fonction de son email
        $user = $entityManager->getRepository(UserOrdrePharma::class)->findOneBy(['email' => $email]);

        if (!$user) {
            // Si l'utilisateur n'est pas trouvé, retour d'une erreur
            return new JsonResponse(['message' => 'Email ou mot de passe incorrect'], 401);
        }

        // Vérification du mot de passe haché
        if (!$passwordHasher->isPasswordValid($user, $password)) {
            return new JsonResponse(['message' => 'Email ou mot de passe incorrect'], 401);
        }

        // Vérifier si c'est l'administrateur général
        if ($user->getEmail() === 'admin@gmail.com') {
            // Rediriger l'administrateur général vers son tableau de bord
            return new JsonResponse(['redirect' => '/admin/admingener'], 200);
        }

        // Rediriger les autres utilisateurs
        return new JsonResponse(['redirect' => '/admin/ordrepharmac'], 200);
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
    
}
