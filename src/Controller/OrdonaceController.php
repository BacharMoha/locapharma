<?php

namespace App\Controller;

use App\Entity\Pharmacie;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Attribute\Route;

class OrdonaceController extends AbstractController
{
    #[Route('/ordonace', name: 'app_ordonace')]
    
    public function index( EntityManagerInterface  $entityManager ): Response
    {
        $pharmacie = $entityManager->getRepository(Pharmacie::class)->findAll();

        return $this->render('ordonance.html.twig', [
            'pharmacies' => $pharmacie,
        ]);
    }
    #[Route('/login_cmd', name: 'login_cmd')]
    public function login( ): Response
    {
        return $this->render('login_cmd.html.twig', [
            
        ]);
    }
    #[Route('/confordonannace', name: 'app_confirmation')]
    public function commande(Request $request, SessionInterface $session,EntityManagerInterface  $entityManager): Response
{
    // Vérifier si l'utilisateur est connecté
    $userId = $session->get('user_id');

    if ($request->isMethod('POST')) {
        if (!$userId) {
            // Si non connecté, redirigez vers une page de connexion ou affichez un message
            $this->addFlash('error', 'Veuillez vous connecter pour envoyer la commande.');
            return $this->redirectToRoute('login_cmd');
        }

        // Traitement de la commande pour les utilisateurs connectés
        $pharmacie = $request->request->get('pharmacie');
        $description = $request->request->get('description');
        $ordonance = $request->files->get('ordonance'); // Si un fichier est envoyé

        // Sauvegarde ou logique de commande ici
        
    }
    $pharmacies = $entityManager->getRepository(Pharmacie::class)->findAll();
    return $this->render('confirmation.html.twig', [
        'isConnected' => (bool) $userId, // Passer le statut de connexion à la vue
        'pharmacies' => $pharmacies,
    ]);
}
 
    #[Route('/payer', name: 'app_payer')]
    public function payer( EntityManagerInterface  $entityManager ): Response
    {
        $pharmacie = $entityManager->getRepository(Pharmacie::class)->findAll();

        return $this->render('payement.html.twig', [
            'pharmacies' => $pharmacie,
        ]);
    }
}
